# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/zyedidia"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.CommitHash=a02ae3c"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:4a1e882"
	"github.com/dustin/go-humanize:259d2a1"
	"github.com/flynn/json5:7620272"
	"github.com/go-errors/errors:8fa88b0"
	"github.com/mattn/go-isatty:fc9e8d8"
	"github.com/mattn/go-runewidth:97311d9"
	"github.com/mitchellh/go-homedir:b8bc1bf"
	"github.com/sergi/go-diff:feef008"
	"github.com/yuin/gopher-lua:b402f31"
	"github.com/layeh/gopher-luar:6a6a71f -> layeh.com" #v1.0.1
	"github.com/zyedidia/clipboard:adacf41"
	"github.com/zyedidia/glob:dd4023a"
	"github.com/zyedidia/poller:ab09682"
	"github.com/zyedidia/tcell:c92e80b"
	"github.com/gdamore/encoding:b23993c"
	"github.com/lucasb-eyer/go-colorful:c900de9"
	"github.com/golang/net:a8b9294 -> golang.org/x"
	"github.com/golang/text:1cbadb4 -> golang.org/x" #v0.2.0
	"github.com/go-yaml/yaml:287cf08 -> gopkg.in/yaml.v2"
)

inherit golang-single

DESCRIPTION="A modern and intuitive terminal-based text editor"
HOMEPAGE="https://micro-editor.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

DOCS=( "${S}"/runtime/help/ )
