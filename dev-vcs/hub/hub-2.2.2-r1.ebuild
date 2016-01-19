# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/github"
GOLANG_PKG_ARCHIVE_PREFIX="v"
GOLANG_PKG_LDFLAGS="-X github.com/github/hub/version.Version=${PV}"
GOLANG_PKG_DEPEND_ON_GO_SUBSLOT="yes"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single bash-completion-r1

DESCRIPTION="Hub wraps git in order to extend it with extra features and commands"
HOMEPAGE="http://hub.github.com"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="!dev-util/hub
	>=dev-vcs/git-1.7.3"

DOC=( README.md )

src_install(){
	golang-single_src_install

	# see ttps://github.com/github/hub/issues/977
	cp man/${PN}.1 man/git${PN}.1 || die
	doman man/*.1

	insinto /usr/share/zsh/site-functions
	newins etc/hub.zsh_completion _${PN}
}
