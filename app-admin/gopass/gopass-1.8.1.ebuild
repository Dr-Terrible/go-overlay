# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/justwatchcom"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-extldflags '-static' -X main.version=${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single bash-completion-r1

DESCRIPTION="The slightly more awesome standard unix password manager for teams"
HOMEPAGE="https://www.justwatch.com/gopass"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="bash-completion zsh-completion fish-completion dmenu"

DEPEND="app-crypt/gpgme:1
	dev-vcs/git[threads,gpg,curl]
	dmenu? ( x11-misc/dmenu x11-misc/xdotool )"
RDEPEND="${DEPEND}
	zsh-completion? ( app-shells/zsh )
	fish-completion? ( app-shells/fish )"

DOCS+=" docs/*"

src_install() {
	golang-single_src_install

	# Install fish completion files
	if use fish-completion; then
		${GOBIN}/gopass completion fish > "${T}"/${PN}.fish || die
		insinto /usr/share/fish/functions
		doins "${T}"/${PN}.fish
	fi

	# Install bash completion files
	if use bash-completion; then
		${GOBIN}/gopass completion bash > "${T}"/${PN} || die
		dobashcomp "${T}"/${PN}
	fi

	# Install zsh completion files
	if use zsh-completion; then
		${GOBIN}/gopass completion zsh > "${T}"/${PN}.zsh || die
		insinto /usr/share/zsh/site-functions
		newins "${T}"/${PN}.zsh _${PN}
	fi
}

src_test() {
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
