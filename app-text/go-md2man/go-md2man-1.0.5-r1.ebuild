# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/cpuguy83"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/russross/blackfriday:006144a"
	"github.com/shurcooL/sanitized_anchor_name:10ef21a"
)

inherit golang-single

DESCRIPTION="Command-line tool to convert Markdown into UNIX man pages"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="!dev-go/go-md2man"

src_install() {
	golang-single_src_install

	# generate man pages
	"${GOBIN}"/${PN} -in "${S}"/${PN}.1.md -out "${T}"/${PN}.1
	doman "${T}"/${PN}.1
}
