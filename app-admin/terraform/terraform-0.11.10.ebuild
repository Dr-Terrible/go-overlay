# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/hashicorp"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Terraform builds, changes, and combines infrastructure safely and efficiently"
HOMEPAGE="http://www.terraform.io"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="zsh-completion fish-completion"

RDEPEND="fish-completion? ( app-shells/fish )
	zsh-completion? ( app-shells/zsh )"

DOCS=(
	README.md
	examples/
)

src_install() {
	golang-single_src_install

	# Install fish completion files
	if use fish-completion; then
		insinto /usr/share/fish/functions/
		newins contrib/fish-completion/${PN}.fish ${PN}.fish
	fi

	# Install zsh completion files
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins contrib/zsh-completion/_${PN} _${PN}
	fi
}
