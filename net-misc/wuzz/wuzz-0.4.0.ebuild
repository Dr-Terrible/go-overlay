# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/asciimoo"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/BurntSushi/toml:b26d9c3"  #v0.3.0
	"github.com/jroimartin/gocui:4f518ed"
	"github.com/mattn/go-runewidth:9e777a8"   #v0.0.2
	"github.com/mitchellh/go-homedir:b8bc1bf"
	"github.com/nsf/termbox-go:aa4a75b"
	"github.com/nwidger/jsoncolor:75a6de4"
	"github.com/tidwall/gjson:5a69e67" #v1.0.1
	"github.com/tidwall/match:1731857"
	"github.com/x86kernel/htmlcolor:cf1d377"
	"github.com/golang/net:a337091 -> golang.org/x"
	"github.com/fatih/color:570b54c" #v1.5.0
)

inherit golang-single

DESCRIPTION="Interactive cli tool for HTTP inspection"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm"
