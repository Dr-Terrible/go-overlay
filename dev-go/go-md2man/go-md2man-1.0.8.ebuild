# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/cpuguy83"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Command-line tool to convert Markdown into UNIX man pages"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_install() {
	golang-single_src_install

	# generate man pages
	"${GOBIN}"/${PN} -in "${S}"/${PN}.1.md -out "${T}"/${PN}.1 || die
	doman "${T}"/${PN}.1
}
