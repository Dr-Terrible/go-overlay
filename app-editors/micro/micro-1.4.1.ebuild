# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/zyedidia"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.CommitHash=af520cf"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:4a1e882"
	"github.com/dustin/go-humanize:259d2a1"
	"github.com/flynn/json5:7620272"
	"github.com/go-errors/errors:8fa88b0"
	"github.com/jtolds/gls:77f1821"
	"github.com/smartystreets/assertions:0b37b35"
	"github.com/smartystreets/goconvey:e5b2b7c"
	"github.com/mattn/go-isatty:fc9e8d8"
	"github.com/mattn/go-runewidth:97311d9"
	"github.com/mitchellh/go-homedir:b8bc1bf"
	"github.com/sergi/go-diff:feef008"
	"github.com/yuin/gopher-lua:b402f31"
	"github.com/layeh/gopher-luar:2518c81 -> layeh.com" #v1.0.4
	"github.com/zyedidia/clipboard:4611e80"
	"github.com/zyedidia/glob:dd4023a"
	"github.com/zyedidia/poller:ab09682"
	"github.com/zyedidia/tcell:208b6e8"
	"github.com/zyedidia/terminal:1760577"
	"github.com/zyedidia/pty:3036466"
	"github.com/gdamore/encoding:b23993c"
	"github.com/lucasb-eyer/go-colorful:c900de9"
	"github.com/golang/net:03003ca -> golang.org/x"
	"github.com/golang/text:f21a4df -> golang.org/x"      #v0.3.0
	"github.com/go-yaml/yaml:5420a8b -> gopkg.in/yaml.v2" #v2.2.1
)

inherit golang-single

DESCRIPTION="A modern and intuitive terminal-based text editor"
HOMEPAGE="https://micro-editor.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

DOCS=( "${S}"/runtime/help/ )
