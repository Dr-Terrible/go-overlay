# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/esimov"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fogleman/gg:e611489"
	"github.com/fogleman/imview:7f26a71"
	"github.com/jroimartin/gocui:4f518ed"
	"github.com/go-gl/gl:ac0d3d2"
	"github.com/go-gl/glfw:513e4f2"
	"github.com/golang/freetype:e2365df"
	"github.com/nsf/termbox-go:aa4a75b"
	"github.com/golang/image:f7e31b4 -> golang.org/x"
	"github.com/mattn/go-runewidth:9e777a8" #v0.0.2
)

inherit golang-single

DESCRIPTION="CLI app to convert ascii arts into hand drawn diagrams."

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
