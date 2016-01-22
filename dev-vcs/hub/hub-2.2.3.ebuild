# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/github"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X github.com/github/hub/version.Version=${PV}"
GOLANG_PKG_DEPEND_ON_GO_SUBSLOT="yes"

GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fhs/go-netrc:4422b68"
	"github.com/jingweno/go-sawyer:1999ae5"
	"github.com/golang/crypto:3760e01 -> golang.org/x"
	"github.com/jtacoma/uritemplates:802b8e2"
	"github.com/kardianos/osext:29ae4ff"
	"github.com/kr/binarydist:9955b0a"
)

inherit golang-single bash-completion-r1

DESCRIPTION="Hub wraps git in order to extend it with extra features and commands"
HOMEPAGE="http://hub.github.com"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="!dev-util/hub
	>=dev-vcs/git-1.7.3"

DOC=( CONTRIBUTING.md README.md )

src_install() {
	golang-single_src_install

	# Fix 'git help hub' failure
	# ( see https://github.com/github/hub/issues/977 )
	cp man/${PN}.1 man/git${PN}.1 || die
	doman man/*.1

	# install bash/zsh completion files
	newbashcomp etc/${PN}.bash_completion.sh ${PN}
	insinto /usr/share/zsh/site-functions
	newins etc/${PN}.zsh_completion _${PN}
}
