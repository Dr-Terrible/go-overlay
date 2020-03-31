# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/cloudson"
GOLANG_PKG_VERSION="fa64865c63c38befeaa7d3c09d69567ce5d0ad75"
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/chzyer/readline:62c6fe6"   #v1.4.0
	"github.com/jessevdk/go-flags:8bc97d6" #v1.1
	"github.com/pkg/errors:645ef00"        #v0.8.0
	"github.com/olekukonko/tablewriter:44e365d"
	"github.com/mattn/go-runewidth:737072b"

	# Unofficial forks of libgit2 and git2go specific for gitql
	"github.com/cloudson/git2go:6ae9144"
	"github.com/cloudson/libgit2:c62b30d"
)

CMAKE_IN_SOURCE_BUILD=1
inherit cmake-utils golang-single

DESCRIPTION="A git query language"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE+=" libressl +ssh threads"

RDEPEND="!libressl? ( dev-libs/openssl:0 )
	libressl? ( dev-libs/libressl )
	sys-libs/zlib
	net-libs/http-parser:=
	ssh? ( net-libs/libssh2 )"

DEPEND="virtual/pkgconfig"

RESTRICT+=" test"

src_prepare() {
	golang-single_src_prepare

	# Forces a static compilation of libgit2
	libgit2="${GOPATH}/src/github.com/cloudson/libgit2"
	sed -i \
		-e "s:#cgo pkg-config\: libgit2:#cgo pkg-config\: ${libgit2}/libgit2.pc:" \
		"${GOPATH}"/src/github.com/cloudson/git2go/settings/settings.go \
		"${GOPATH}"/src/github.com/cloudson/git2go/git.go \
		"${GOPATH}"/src/github.com/cloudson/git2go/branch.go \
		|| die

	CMAKE_USE_DIR="${libgit2}"
	cmake-utils_src_prepare
}

src_compile() {
	# Compiles forked version of libgit2
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="${EPREFIX}/usr/$(get_libdir)/${PN}"
		-DBUILD_SHARED_LIBS=ON
		-DBUILD_EXAMPLES=OFF
		-DBUILD_CLAR=OFF
		-DTAGS=OFF
		-DPROFILE=OFF
		-DENABLE_TRACE="$(usex debug)"
		-DUSE_ICONV=OFF
		-DVALGRIND=OFF
		-DUSE_SSH="$(usex ssh)"
		-DTHREADSAFE="$(usex threads)"
	)
	cmake-utils_src_configure
	cmake-utils_src_compile

	# Compiles gitql
	# NOTE: gitql uses libgit2 v0.21.0 which doesn't support static compilation,
	#       so we force the dynamic linking and then we change the rpath of the
	#       executable to point to /usr/lib*/gitql to avoid a file collision
	#       with libraries provided by dev-libs/libgit2:0.
	#       Dynamic linking breaks unit testing, so USE flag 'test' is disabled.
	export CGO_CFLAGS="-I${libgit2}/include"
	export CGO_LDFLAGS="-L${libgit2} -lgit2 -Wl,-rpath -Wl,/usr/$(get_libdir)/${PN}"
	golang-single_src_compile
}

src_install() {
	golang-single_src_install
	cmake-utils_src_install

	# remove header and pkg-config files for libgit2 (we just need the library)
	rm -r "${ED}"/usr/include || die
	rm -r "${ED}"/usr/lib64/${PN}/pkgconfig/libgit2.pc || die
}
