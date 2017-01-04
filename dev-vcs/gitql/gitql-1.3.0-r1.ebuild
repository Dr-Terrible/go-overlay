# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/cloudson"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/chzyer/readline:62c6fe6" #v1.4.0
	"github.com/jessevdk/go-flags:8bc97d6" #v1.1
	"github.com/pkg/errors:645ef00" #v0.8.0
	"github.com/olekukonko/tablewriter:44e365d"
	"github.com/mattn/go-runewidth:737072b"

	# Unofficial forks of libgit2 and git2go specific for gitql
	"github.com/cloudson/git2go:6ae9144"
	"github.com/cloudson/libgit2:c62b30d"
)

inherit cmake-utils golang-single

DESCRIPTION="A git query language"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="${IUSE} libressl +ssh test +threads trace"

RDEPEND="!libressl? ( dev-libs/openssl:0 )
	libressl? ( dev-libs/libressl )
	sys-libs/zlib
	net-libs/http-parser:=
	ssh? ( net-libs/libssh2 )"

DEPEND="virtual/pkgconfig"

src_prepare() {
	golang-single_src_prepare

	# Forces a static compilation of libgit2
	LIBGIT2="${GOPATH}/src/github.com/cloudson/libgit2"
	sed -i \
		-e "s:#cgo pkg-config\: libgit2:#cgo pkg-config\: --static ${LIBGIT2}/libgit2.pc:" \
		"${GOPATH}"/src/github.com/cloudson/git2go/settings/settings.go \
		"${GOPATH}"/src/github.com/cloudson/git2go/git.go \
		"${GOPATH}"/src/github.com/cloudson/git2go/branch.go \
		|| die
}

src_compile() {
	# Compiles forked version of libgit2
	CMAKE_USE_DIR="${LIBGIT2}"
	pushd "${CMAKE_USE_DIR}"  > /dev/null || die
		CMAKE_IN_SOURCE_BUILD=1
		local mycmakeargs=(
			-DCMAKE_INSTALL_PREFIX=install
			-DBUILD_SHARED_LIBS=OFF
			-DCMAKE_C_FLAGS=-fPIC
			-DCMAKE_BUILD_TYPE=RelWithDebInfo
			-DBUILD_CLAR="$(usex test)"
			-DENABLE_TRACE="$(usex trace)"
			-DUSE_SSH="$(usex ssh)"
			-DTHREADSAFE="$(usex ssh)"
		)
		cmake-utils_src_configure
		cmake-utils_src_compile
	popd > /dev/null || die

	# Compiles gitql
	local FLAGS=$( pkg-config --static --libs ${LIBGIT2}/libgit2.pc )
	export CGO_LDFLAGS="${LIBGIT2}/libgit2.a -L${LIBGIT2} ${FLAGS}"
	export CGO_CFLAGS="-I${LIBGIT2}/include"
	golang-single_src_compile
}
