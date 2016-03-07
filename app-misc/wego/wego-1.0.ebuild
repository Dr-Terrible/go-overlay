# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/schachmat"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mattn/go-colorable:9fdad7c"
	"github.com/mattn/go-runewidth:d037b52"
)

inherit golang-single

DESCRIPTION="Wego is a weather client for the terminal"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
