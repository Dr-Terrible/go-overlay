# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/davecheney"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fatih/color:0016e26"
	"github.com/mattn/go-colorable:ed8eb9e" #v0.0.6
	"github.com/mattn/go-isatty:66b8e73"
	"github.com/golang/net:f09c466 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="It's like curl -v, with colours"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
