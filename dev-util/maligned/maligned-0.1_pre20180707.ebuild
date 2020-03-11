# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/mdempsky"
GOLANG_PKG_VERSION="6e39bd26a8c8b58c5a22129593044655a9e25959"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:8051706"  #v1.0.0
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
)

inherit golang-single

DESCRIPTION="Detects Go structs that would take less memory if their fields were sorted"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
