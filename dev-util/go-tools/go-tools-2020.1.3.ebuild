# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="honnef.co/go"
GOLANG_PKG_NAME="${PN//go-/}"
GOLANG_PKG_VERSION="$PV"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/BurntSushi/toml:3012a1d"               #v0.3.1
	"github.com/google/renameio:f0e3298"               #v0.1.0
	"github.com/kisielk/gotool:8051706"                #v1.0.0
	"github.com/rogpeppe/go-internal:4385788"          #v1.3.0
	"github.com/golang/mod:4bf6d31 -> golang.org/x"
	"github.com/golang/tools:6e064ea -> golang.org/x"
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.com/dominikh/${PN}/archive/${GOLANG_PKG_VERSION}.tar.gz -> ${P}.tar.gz"

inherit golang-single

DESCRIPTION="Collection of linters and static-analysis tools for Go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_unpack() {
	local GOLANG_PKG_NAME="$PN"
	golang-single_src_unpack
}
