# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/git-time-metric"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/git-time-metric/git2go:342230c" # 'next' branch
	#"github.com/git-time-metric/libgit2:a6763ff" # v0.25.0-rc1
	"github.com/libgit2/libgit2:2fcb870" #v0.25.1
	"github.com/mattn/go-isatty:30a891c"
	"github.com/mitchellh/cli:494eb00"
	"github.com/armon/go-radix:4239b77"
	"github.com/bgentry/speakeasy:675b82c"
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

	# Create a writable GOROOT in order to avoid sandbox violations.
	GOROOT="${WORKDIR}/goroot"
	cp -sR "$(go env GOROOT)" "${GOROOT}" || die
	export GOROOT

	# Link libgit2 as a vendored dependency for git2go
	libgit2="${GOPATH}/src/github.com/libgit2/libgit2"
	git2go="${GOPATH}/src/github.com/git-time-metric/git2go"
	rm -r "${git2go}"/vendor/libgit2 || die
	ln -s "${libgit2}" "${git2go}"/vendor/libgit2 || die

	# Fix: force cgo to use the vendored libgit2 lib instead of the one from the system
	pushd ../git2go > /dev/null || die
		epatch "${FILESDIR}/${PN}-golang-cgo.patch"
	popd > /dev/null || die
}

src_compile() {
	einfo "go install github.com/git-time-metric/git2go/... "
	pushd "${git2go}" > /dev/null || die
		emake install || die
	popd > /dev/null || die

	golang-single_src_compile
}
