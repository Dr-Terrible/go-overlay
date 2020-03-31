# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/akavel"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/gdamore/tcell:de7e78e"           #v1.1.0
	"github.com/gdamore/encoding:b23993c"
	"github.com/lucasb-eyer/go-colorful:345fbb3" #v1.0
	"github.com/mattn/go-runewidth:ce7b0b5"      #v0.0.3
	"github.com/mattn/go-isatty:6ca4dbf"         #v0.0.4
	"github.com/spf13/pflag:298182f"

	"github.com/golang/text:f21a4df -> golang.org/x" #v0.3.0
)

inherit golang-single

DESCRIPTION="Ultimate Plumber is a tool for writing Linux pipes with instant live preview"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"
