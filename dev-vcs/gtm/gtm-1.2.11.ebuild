# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/git-time-metric"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV}"
GOLANG_PKG_TAGS="static"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/libgit2/git2go:eb0bf21"     #v26
	"github.com/libgit2/libgit2:15e1193"    #v0.26.0
	"github.com/mattn/go-isatty:0360b2a"    #v0.0.3
	"github.com/mitchellh/cli:518dc67"
	"github.com/armon/go-radix:1fca145"
	"github.com/hashicorp/go-multierror:b7773ae"
	"github.com/posener/complete:dc2bc5a"   #v1.1
	"github.com/bgentry/speakeasy:4aabc24"  #v0.1.0
)

CMAKE_IN_SOURCE_BUILD=1
inherit cmake-utils golang-single

DESCRIPTION="Simple, seamless, lightweight time tracking for Git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="libressl threads +ssh +curl"

RDEPEND="
	!libressl? ( dev-libs/openssl:0 )
	libressl? ( dev-libs/libressl )
	sys-libs/zlib
	net-libs/http-parser:=
	ssh? ( net-libs/libssh2 )
	curl? ( net-misc/curl )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	golang-single_src_prepare

	# Link libgit2 as a vendored dependency for git2go
	libgit2="${GOPATH}/src/github.com/libgit2/libgit2"
	git2go="${GOPATH}/src/github.com/libgit2/git2go"
	rm -r "${git2go}"/vendor/libgit2 || die
	ln -s "${libgit2}" "${git2go}"/vendor/libgit2 || die

	# Force cgo to use the vendored libgit2 lib
	# instead of the one from the system (if present)
	pushd "${git2go}" > /dev/null || die
		epatch "${FILESDIR}/${P}-golang-cgo.patch"
		chmod u+x pkg-config-wrapper.sh || die
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

	# Build gtm
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_compile
}
