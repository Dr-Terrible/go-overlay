# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/git-time-metric"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV}"
GOLANG_PKG_TAGS="static"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/libgit2/git2go:334260d" #v25
	"github.com/libgit2/libgit2:2fcb870" #v0.25.1
	"github.com/mattn/go-isatty:fc9e8d8"
	"github.com/mitchellh/cli:b481eac"
	"github.com/armon/go-radix:4239b77"
	"github.com/bgentry/speakeasy:4aabc24"
)

inherit golang-single

DESCRIPTION="Simple, seamless, lightweight time tracking for Git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="libressl"

RDEPEND="
	!libressl? ( dev-libs/openssl:0 )
	libressl? ( dev-libs/libressl )
	sys-libs/zlib
	net-libs/http-parser:=
	net-libs/libssh2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	golang-single_src_prepare

	# Link libgit2 as a vendored dependency for git2go
	libgit2="${GOPATH}/src/github.com/libgit2/libgit2"
	git2go="${GOPATH}/src/github.com/libgit2/git2go"
	rm -r "${git2go}"/vendor/libgit2 || die
	ln -s "${libgit2}" "${git2go}"/vendor/libgit2 || die

	# Fix: force cgo to use the vendored libgit2 lib instead of the one from the system
	pushd "${git2go}" > /dev/null || die
		epatch "${FILESDIR}/${PN}-golang-cgo.patch"
	popd > /dev/null || die
}

src_compile() {
	einfo "go install ${git2go//${GOPATH}\/src\//}/... "
	pushd "${git2go}" > /dev/null || die
		# TODO: use cmake eclass and build a static lib without debug symbols
		emake build-static || die
	popd > /dev/null || die

	golang-single_src_compile
}
