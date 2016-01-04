# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/rakyll"
GOLANG_PKG_VERSION="db2aa4d390a187cd917d665eade44ad340fe68c1"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/gizak/termui:551f2e7"
	"github.com/mattn/go-runewidth:d96d1bd"
	"github.com/nsf/termbox-go:9554a56"
	"github.com/rakyll/statik:274df120e9"
)
inherit golang-single

DESCRIPTION="A visual interface to work with runtime profiling data for Go"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
