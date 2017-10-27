# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/junegunn"
GOLANG_PKG_BUILDPATH="/src/${PN}"
GOLANG_PKG_TAGS="release"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/junegunn/go-isatty:66b8e73"
	"github.com/junegunn/go-runewidth:63c378b"
	"github.com/junegunn/go-shellwords:33bd8f1"
	"github.com/golang/crypto:854ae91 -> golang.org/x"
)

inherit golang-single bash-completion-r1

DESCRIPTION="A general-purpose command-line fuzzy finder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="tmux neovim vim bash-completion zsh-completion fish-completion"

RDEPEND="tmux? ( app-misc/tmux )"

src_install() {
	golang-single_src_install
	doman man/man1/${PN}.1

	# Install TMUX utils
	if use tmux; then
		dobin bin/${PN}-tmux
		doman man/man1/${PN}-tmux.1
	fi

	# Install bash completion files
	if use bash-completion; then
		newbashcomp shell/completion.bash ${PN}
		insinto /etc/profile.d/
		newins shell/key-bindings.bash ${PN}.sh
	fi

	# Install zsh completion files
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins shell/completion.zsh _${PN}
		insinto /usr/share/zsh/site-contrib/
		newins shell/key-bindings.zsh ${PN}.zsh
	fi

	# Install fish completion files
	if use fish-completion; then
		insinto /usr/share/fish/functions/
		newins shell/key-bindings.fish fzf_key_bindings.fish
	fi

	# Install VIM plugin
	if use vim; then
		insinto /usr/share/vim/vimfiles/plugin
		doins plugin/${PN}.vim
	fi

	# Install Neovim plugin
	if use neovim; then
		insinto /usr/share/nvim/runtime/plugin
		doins plugin/${PN}.vim
	fi
}
