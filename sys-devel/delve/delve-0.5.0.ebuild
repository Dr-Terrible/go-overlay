# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/derekparker"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_VERSION="${PV}.beta"
GOLANG_PKG_BUILDPATH="/cmd/dlv"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/peterh/liner:1bb0d1c1a2"
	"github.com/golang/sys:58da1121af -> golang.org/x"
)
inherit golang-single

DESCRIPTION="Delve is a debugger for the Go programming language"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

src_install() {
	golang-single_src_install

	mv "${ED}"/usr/bin/${PN} "${ED}"/usr/bin/dlv || die
}