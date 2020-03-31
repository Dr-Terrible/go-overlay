# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/divan"
GOLANG_PKG_VERSION="bf02ca53aeeac11245186b99b69af0dde07601c4"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/olekukonko/tablewriter:cca8bbc"
	"github.com/golang/tools:354f9f8 -> golang.org/x"
	"github.com/mattn/go-runewidth:d037b52"
)

inherit golang-single

DESCRIPTION="Prints stats and suggests to remove small LeftPad-like imports from Go packages"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"
