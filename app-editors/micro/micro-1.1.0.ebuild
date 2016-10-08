# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/zyedidia"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.CommitHash=5e82fc4 -X 'main.CompileDate=$( date -u '+%Y-%m-%d' )'"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:60ec348" #v3.3.0
	"github.com/go-errors/errors:a418503"
	"github.com/layeh/gopher-luar:921d03e"
	"github.com/mattn/go-isatty:66b8e73"
	"github.com/mattn/go-runewidth:d6bea18" #v0.0.1
	"github.com/mitchellh/go-homedir:756f7b1"
	"github.com/sergi/go-diff:ec7fdbb"
	"github.com/yosuke-furukawa/json5:07fdad7"
	"github.com/yuin/gopher-lua:6a1397d"
	"github.com/zyedidia/clipboard:7249767"
	"github.com/zyedidia/glob:7cf5a07"
	"github.com/zyedidia/tcell:66ed19a"
	"github.com/zyedidia/json5:2518f8b"
	"github.com/gdamore/encoding:b23993c"
	"github.com/lucasb-eyer/go-colorful:9c2852a"
	"github.com/golang/text:1e65e9b -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A modern and intuitive terminal-based text editor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
