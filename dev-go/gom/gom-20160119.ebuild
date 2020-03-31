# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/rakyll"
GOLANG_PKG_VERSION="dbdd968e88d8c259a2e2dd03422e5ec58c79f48d"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/gizak/termui:551f2e7"
	"github.com/mattn/go-runewidth:d96d1bd"
	"github.com/nsf/termbox-go:9554a56"
	"github.com/rakyll/statik:274df120e9"
)
inherit golang-single

DESCRIPTION="A visual interface to work with runtime profiling data for Go"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
