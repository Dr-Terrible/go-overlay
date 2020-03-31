# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/rgburke"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_TAGS="static"
GOLANG_PKG_LDFLAGS="-X main.version=${PV} -X main.headOid=ffbd489"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bradfitz/slice:d9036e2"
	"github.com/camlistore/go4:034d17a"
	"github.com/gobwas/glob:bea32b9" #v0.2.2
	"github.com/golang/crypto:b080dc9 -> golang.org/x"
	"github.com/golang/sys:4ff8c00 -> golang.org/x"
	"github.com/mattn/go-runewidth:97311d9"
	"github.com/rgburke/goncurses:9a788ac"
	"github.com/rjeczalik/notify:767eb67"
	"github.com/Sirupsen/logrus:95cd2b9"
	"github.com/tchap/go-patricia:666120d" #v2.2.6
	"github.com/libgit2/libgit2:2fcb870"   #v0.25.1
	"github.com/libgit2/git2go:334260d -> gopkg.in/libgit2/git2go.v25"

	# unit testing
	"github.com/stretchr/testify:2aa2c17"
)

CMAKE_IN_SOURCE_BUILD=1
inherit cmake-utils golang-single

DESCRIPTION="GRV is a terminal interface for viewing git repositories"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="libressl threads +ssh +curl"

DEPEND="
	sys-libs/ncurses:0
	sys-libs/readline:0
	!libressl? ( dev-libs/openssl:0 )
	libressl? ( dev-libs/libressl )
	sys-libs/zlib
	net-libs/http-parser:=
	ssh? ( net-libs/libssh2 )
	curl? ( net-misc/curl )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( README.md doc/documentation.md )

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/camlistore/go4" \
		"go4.org"

	# Link libgit2 as a vendored dependency for git2go
	libgit2="${GOPATH}/src/github.com/libgit2/libgit2"
	git2go="${GOPATH}/src/gopkg.in/libgit2/git2go.v25"
	rm -r "${git2go}"/vendor/libgit2 || die
	ln -s "${libgit2}" "${git2go}"/vendor/libgit2 || die

	# Force cgo to use the vendored libgit2 lib
	# instead of the one from the system (if present)
	pushd "${git2go}" > /dev/null || die
		epatch "${FILESDIR}/${PN}-golang-cgo.patch"
		chmod u+x pkg-config-wrapper.sh || die
	popd > /dev/null || die

	# libressl fix; bug #606556
	pushd "${libgit2}" > /dev/null || die
		epatch "${FILESDIR}/libgit2-0.24.6-libressl.patch"
	popd > /dev/null || die

	CMAKE_USE_DIR="${libgit2}"
	cmake-utils_src_prepare
}

src_compile() {
	export PKG_CONFIG=${git2go}/pkg-config-wrapper.sh

	# Build libgit2 as a static lib
	local mycmakeargs=(
		-DSONAME=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DBUILD_EXAMPLES=OFF
		-DBUILD_CLAR=OFF
		-DTAGS=OFF
		-DPROFILE=OFF
		-DENABLE_TRACE=OFF
		-DUSE_ICONV=OFF
		-DVALGRIND=OFF
		-DDEBUG_POOL=OFF
		-DUSE_OPENSSL=ON
		-DCURL="$(usex curl)"
		-DUSE_GSSAPI=OFF
		-DUSE_SSH="$(usex ssh)"
		-DTHREADSAFE="$(usex threads)"
	)
	cmake-utils_src_configure
	cmake-utils_src_compile

	# Build grv
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_compile
}
