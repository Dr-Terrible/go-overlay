# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/junegunn"
GOLANG_PKG_BUILDPATH="/src/${PN}"
GOLANG_PKG_TAGS="release"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/junegunn/go-isatty:66b8e73"
	"github.com/junegunn/go-runewidth:63c378b"
	"github.com/junegunn/go-shellwords:35d512a"
)

inherit golang-single bash-completion-r1

DESCRIPTION="A general-purpose command-line fuzzy finder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="tmux vim"

RDEPEND="sys-libs/ncurses[-tinfo]
	tmux? ( app-misc/tmux )"

src_install() {
	golang-single_src_install
	doman man/man1/${PN}.1

	# Install TMUX utils
	if use tmux; then
		dobin bin/${PN}-tmux
		doman man/man1/${PN}-tmux.1
	fi

	# Install bash completion files
	newbashcomp shell/completion.bash ${PN}
	insinto /etc/profile.d/
	newins shell/key-bindings.bash ${PN}.sh

	# Install zsh completion files
	insinto /usr/share/zsh/site-functions
	newins shell/completion.zsh _${PN}
	insinto /usr/share/zsh/site-contrib/
	newins shell/key-bindings.zsh ${PN}.zsh

	# Install fish completion files
	insinto /usr/share/fish/functions/
	newins shell/key-bindings.fish ${PN}.fish

	# Install VIM plugin
	if use vim; then
		insinto /usr/share/vim/vimfiles/plugin
		doins plugin/${PN}.vim
	fi
}
