# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/zyedidia"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.CommitHash=a02ae3c"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:2ee8785" #v3.5.1
	"github.com/dustin/go-humanize:79e699c"
	"github.com/flynn/json5:7620272"
	"github.com/go-errors/errors:8fa88b0"
	"github.com/mattn/go-isatty:0360b2a" #v0.0.3
	"github.com/mattn/go-runewidth:9e777a8" #v0.0.2
	"github.com/mitchellh/go-homedir:b8bc1bf"
	"github.com/sergi/go-diff:feef008"
	"github.com/yuin/gopher-lua:eb1c729"
	"github.com/layeh/gopher-luar:6a6a71f -> layeh.com" #v1.0.1
	"github.com/zyedidia/clipboard:adacf41"
	"github.com/zyedidia/glob:dd4023a"
	"github.com/zyedidia/tcell:c47e755"  # branch idle-wakeup-fix-forked
	"github.com/gdamore/encoding:b23993c"
	"github.com/lucasb-eyer/go-colorful:2312723"
	"github.com/golang/text:1cbadb4 -> golang.org/x" #v0.2.0
	"github.com/go-yaml/yaml:eb3733d -> gopkg.in/yaml.v2"
)

inherit golang-single

DESCRIPTION="A modern and intuitive terminal-based text editor"
HOMEPAGE="https://micro-editor.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
