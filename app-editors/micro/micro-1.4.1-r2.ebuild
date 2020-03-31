# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/zyedidia"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.CommitHash=af520cf"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:ba2c2dd"                     #v3.6.1
	"github.com/dustin/go-humanize:9f541cc"               #v1.0.0
	"github.com/flynn/json5:7620272"
	"github.com/go-errors/errors:a6af135"                 #v1.0.1
	"github.com/jtolds/gls:b4936e0"                       #v4.20.0
	"github.com/smartystreets/assertions:8374cff"         #v1.0.1
	"github.com/smartystreets/goconvey:505e419"           #v1.6.4
	"github.com/mattn/go-isatty:7b513a9"                  #v0.0.12
	"github.com/mattn/go-runewidth:a4df4dd"               #v0.0.8
	"github.com/mitchellh/go-homedir:af06845"             #v1.1.0
	"github.com/sergi/go-diff:58c5cb1"                    #v1.1.0
	"github.com/yuin/gopher-lua:ab39c60"
	"github.com/layeh/gopher-luar:bb67d56 -> layeh.com"   #v1.0.7
	"github.com/zyedidia/clipboard:241f98e"
	"github.com/zyedidia/glob:dd4023a"
	"github.com/zyedidia/poller:03c5c28"                  #v1.0.1
	"github.com/zyedidia/tcell:208b6e8"
	"github.com/zyedidia/terminal:533c623"
	"github.com/zyedidia/pty:3036466"                     #v2.0.0
	"github.com/gdamore/encoding:6289cdc"                 #v1.0.0
	"github.com/lucasb-eyer/go-colorful:fadcb7c"          #v1.0.3
	"github.com/golang/text:342b2e1 -> golang.org/x"      #v0.3.2
	"github.com/golang/sys:d101bd2 -> golang.org/x"
	"github.com/golang/net:1617124 -> golang.org/x"
	"github.com/go-yaml/yaml:53403b5 -> gopkg.in/yaml.v2" #v2.2.8
)

inherit golang-single

DESCRIPTION="A modern and intuitive terminal-based text editor"
HOMEPAGE="https://micro-editor.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

DOCS=( "${S}"/runtime/help/ )
