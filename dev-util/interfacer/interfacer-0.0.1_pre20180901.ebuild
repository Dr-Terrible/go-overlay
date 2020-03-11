# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="mvdan.cc"
GOLANG_PKG_VERSION="c20040233aedb03da82d460eca6130fcd91c629a"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mvdan/lint:adc824a -> mvdan.cc"
	"github.com/kisielk/gotool:8051706"                #v1.0.0
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.com/mvdan/${PN}/archive/${GOLANG_PKG_VERSION}.tar.gz -> ${P}.tar.gz"

inherit golang-single

DESCRIPTION="A linter for GoLang that suggests interface types "

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="!dev-go/${PN}"
