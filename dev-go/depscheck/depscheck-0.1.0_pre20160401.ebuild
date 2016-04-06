# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/divan"
GOLANG_PKG_VERSION="bfa535c4ba843899029adfb397d99ca49881a4b0"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/olekukonko/tablewriter:cca8bbc"
	"github.com/golang/tools:fcde774 -> golang.org/x"
	"github.com/mattn/go-runewidth:d037b52"
)

inherit golang-single

DESCRIPTION="Prints stats and suggests to remove small LeftPad-like imports from Golang packages"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"
