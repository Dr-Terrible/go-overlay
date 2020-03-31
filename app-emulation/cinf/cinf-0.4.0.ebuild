# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/mhausenblas"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_VERSION="${PV}-alpha"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/buger/goterm:d281585"
	"github.com/olekukonko/tablewriter:bdcc175"
	"github.com/mattn/go-runewidth:737072b"
)

inherit golang-single

DESCRIPTION="A tool to view namespaces and cgroups, useful for low-level container prodding"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
