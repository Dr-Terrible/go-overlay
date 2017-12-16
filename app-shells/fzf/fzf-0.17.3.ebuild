# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/junegunn"
GOLANG_PKG_TAGS="release"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mattn/go-isatty:66b8e73"
	"github.com/mattn/go-runewidth:14207d2"
	"github.com/mattn/go-shellwords:02e3cf0"  #v1.0.3
	"github.com/golang/crypto:e1a4589 -> golang.org/x"
	"github.com/golang/sys:b90f89a -> golang.org/x"
)

inherit golang-single bash-completion-r1

DESCRIPTION="A general-purpose command-line fuzzy finder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="tmux neovim vim bash-completion zsh-completion fish-completion"

RDEPEND="bash-completion? ( app-shells/bash )
	fish-completion? ( app-shells/fish )
	tmux? ( app-misc/tmux )
	vim? ( app-editors/vim )
	zsh-completion? ( app-shells/zsh )"

src_install() {
	golang-single_src_install
	doman man/man1/${PN}.1

	# Install bash completion files
	if use bash-completion; then
		newbashcomp shell/completion.bash ${PN}
		insinto /etc/profile.d/
		newins shell/key-bindings.bash ${PN}.sh
	fi

	# Install fish completion files
	if use fish-completion; then
		insinto /usr/share/fish/functions/
		newins shell/key-bindings.fish fzf_key_bindings.fish
	fi

	# Install Neovim plugin
	if use neovim; then
		insinto /usr/share/nvim/runtime/plugin
		doins plugin/${PN}.vim
	fi

	# Install TMUX utils
	if use tmux; then
		dobin bin/${PN}-tmux
		doman man/man1/${PN}-tmux.1
	fi

	# Install VIM plugin
	if use vim; then
		insinto /usr/share/vim/vimfiles/plugin
		doins plugin/${PN}.vim
	fi

	# Install zsh completion files
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins shell/completion.zsh _${PN}
		insinto /usr/share/zsh/site-contrib/
		newins shell/key-bindings.zsh ${PN}.zsh
	fi
}
