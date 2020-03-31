# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/robertkrimen"
GOLANG_PKG_VERSION="15f95af6e78dcd2030d8195a138bd88d4f403546"
GOLANG_PKG_BUILDPATH="/${PN}"
#GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/go-sourcemap/sourcemap:b019cc3 -> gopkg.in/sourcemap.v1"  #v2.1.2
	# unit testing
#	"github.com/go-check/check:20d25e2 -> gopkg.in/check.v1"
)

inherit golang-single

DESCRIPTION="CLI for Otto, an JavaScript (ECMA5) interpreter written in Go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

#src_prepare() {
#	golang-single_src_prepare
#
#	golang_fix_importpath_alias \
#		"github.com/olebedev/go-${PN}" \
#		"gopkg.in/olebedev/go-${PN}.v2"
#}
