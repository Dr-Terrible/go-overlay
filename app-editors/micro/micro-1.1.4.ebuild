# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/zyedidia"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.CommitHash=5e82fc4 -X 'main.CompileDate=$( date -u '+%Y-%m-%d' )'"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:b38d23b" #v3.5.0
	"github.com/go-errors/errors:8fa88b0"
	"github.com/layeh/gopher-luar:ab3f305 -> layeh.com"
	"github.com/mattn/go-isatty:dda3de4"
	"github.com/mattn/go-runewidth:9e777a8" #v0.0.2
	"github.com/mitchellh/go-homedir:b8bc1bf"
	"github.com/sergi/go-diff:24e2351"
	"github.com/yuin/gopher-lua:eed1c79"
	"github.com/zyedidia/clipboard:adacf41"
	"github.com/zyedidia/glob:dd4023a"
	"github.com/zyedidia/tcell:856dbb2"
	"github.com/zyedidia/json5:2518f8b"
	"github.com/gdamore/encoding:b23993c"
	"github.com/lucasb-eyer/go-colorful:9c2852a"
	"github.com/golang/text:85c2990 -> golang.org/x"
	"github.com/golang/net:6b27048 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A modern and intuitive terminal-based text editor"
HOMEPAGE="https://micro-editor.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
