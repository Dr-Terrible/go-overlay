# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/getantibody"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/caarlos0/gohome:01f8a21"

	# Unit Testing
	"github.com/codegangsta/cli:f9cc300"
	"github.com/stretchr/testify:f390dcf"
	"github.com/davecgh/go-spew:5215b55"
	"github.com/pmezard/go-difflib:792786c"
)

inherit golang-single

DESCRIPTION="A faster and simpler antigen written in Golang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="app-shells/zsh[unicode]
	dev-vcs/git"

src_install() {
	insinto /usr/libexec/${PN}
	doins ${PN}.zsh

	insinto /usr/libexec/${PN}/bin
	doins ${GOBIN}/${PN}
}
