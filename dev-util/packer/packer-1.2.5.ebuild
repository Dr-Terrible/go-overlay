# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/hashicorp"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Packer is a tool for creating identical machine images for multiple platforms"
HOMEPAGE="http://www.packer.io"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="!app-emulation/packer-bin"

DOCS=( CHANGELOG.md README.md )

src_install() {
	golang-single_src_install

	# prefixing all the binaries
	for pkg in "${ED}"/usr/bin/*; do
		[[ "${PN}" == ${pkg##*/} ]] && continue
		mv "${pkg}" "${ED}"/usr/bin/${PN}-${pkg##*/} || die
	done

	# install zsh-completion
	insinto /usr/share/zsh/site-functions
	doins contrib/zsh-completion/_packer
}
