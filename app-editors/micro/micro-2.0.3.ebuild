# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/zyedidia"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:ba2c2dd"                     #v3.6.1
	"github.com/dustin/go-humanize:9f541cc"               #v1.0.0
	"github.com/go-errors/errors:a6af135"                 #v1.0.1
	"github.com/kballard/go-shellquote:95032a8"
	"github.com/mattn/go-isatty:7b513a9"                  #v0.0.12
	"github.com/mattn/go-runewidth:a4df4dd"               #v0.0.8
	"github.com/mitchellh/go-homedir:af06845"             #v1.1.0
	"github.com/robertkrimen/otto:c382bd3"
	"github.com/sergi/go-diff:58c5cb1"                    #v1.1.0
	"github.com/yuin/gopher-lua:ab39c60"
	"github.com/zyedidia/clipboard:241f98e"
	"github.com/zyedidia/glob:dd4023a"
	"github.com/zyedidia/highlight:201131c"
	"github.com/zyedidia/json5:2da050b"
	"github.com/zyedidia/pty:3036466"                     #v2.0.0
	"github.com/zyedidia/tcell:37fef3e"                   #v1.4.4
	"github.com/zyedidia/terminal:533c623"
	"github.com/layeh/gopher-luar:bb67d56 -> layeh.com"   #v1.0.7
	"github.com/gdamore/encoding:6289cdc"                 #v1.0.0
	"github.com/lucasb-eyer/go-colorful:fadcb7c"          #v1.0.3

	"github.com/golang/text:342b2e1 -> golang.org/x"      #v0.3.2
	"github.com/golang/sys:d101bd2 -> golang.org/x"
	"github.com/go-yaml/yaml:53403b5 -> gopkg.in/yaml.v2" #v2.2.8

	"github.com/stretchr/testify:221dbe5"                 #v1.4.0
)

inherit golang-single

DESCRIPTION="A modern and intuitive terminal-based text editor"
HOMEPAGE="https://micro-editor.github.io https://github.com/zyedidia/micro"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

DOCS=( "${S}"/runtime/help/ )

src_compile() {
	rm "${S}"/go.mod || die
	rm "${S}"/go.sum || die
	emake install-quick GOBIN="${GOBIN}" HASH="f594686" VERSION="${GOLANG_PKG_VERSION}" || die
}

src_test() {
	emake test || die
}
