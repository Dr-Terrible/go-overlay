# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/scaleway"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/scw"
GOLANG_PKG_OUTPUT_NAME="scw"
GOLANG_PKG_HAVE_TEST=1

inherit bash-completion-r1 golang-single

DESCRIPTION="Official command line tool to interact with Scaleway API"
HOMEPAGE="https://github.com/scaleway/scaleway-cli"
LICENSE="MIT"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="zsh-completion"
RDEPEND="zsh-completion? ( app-shells/zsh )"

src_compile() {
	golang-single_src_compile
}

src_install() {
	golang-single_src_install

	newbashcomp contrib/completion/bash/scw scw

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins contrib/completion/zsh/_scw _scw
	fi
}

src_test() {
	if has network-sandbox $FEATURES; then
		eerror "Some tests require 'network-sandbox' to be disabled in FEATURES."
	fi
	emake test || die
}
