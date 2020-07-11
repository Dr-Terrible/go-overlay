# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/mvdan"
GOLANG_PKG_IMPORTPATH_ALIAS="mvdan.cc"
GOLANG_PKG_NAME="sh"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.version=v${PV} -extldflags=-static"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/google/renameio:f0e3298"  #v0.1.0
	"github.com/pkg/diff:5319263"
	"github.com/mvdan/editorconfig:e40951b" #v0.1.1

	"github.com/golang/sys:9197077 -> golang.org/x"
	"github.com/golang/term:ad39bd3 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A shell parser and formatter for POSIX shell and bash"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/mvdan/editorconfig" \
		"mvdan.cc/editorconfig"
}
