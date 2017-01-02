# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/wicast"
GOLANG_PKG_VERSION="e9e5ebc6c31305e23ba7951e95f8a1fb9f9d4828"
GOLANG_PKG_BUILDPATH="/cmd/xmljson2struct"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/clbanning/mxj:b51d44c"
	"github.com/fatih/structs:c701457"
)

inherit golang-single

DESCRIPTION="A small tool for Golang to generate Golang strunc from xml/json file"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm"
