# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_IMPORTPATH_ALIAS="golang.org/x"
GOLANG_PKG_VERSION="738671d3881b9731cc63024d5d88cf28db875626"
GOLANG_PKG_NAME="${PN/go}"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
)

inherit golang-single

DESCRIPTION="This is a linter for Go source code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
