# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/kisielk"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
#	"github.com/kisielk/gotool:d6ce626"
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
)

inherit golang-single

DESCRIPTION="Errcheck checks that you checked errors"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND="!dev-go/${PN}"
