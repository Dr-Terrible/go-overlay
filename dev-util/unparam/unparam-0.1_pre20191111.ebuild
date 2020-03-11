# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="mvdan.cc"
GOLANG_PKG_VERSION="960b1ec0f2c2b042f333e5bfa9516883c0c597f1"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	#"github.com/mvdan/lint:adc824a -> mvdan.cc"
	#"github.com/kisielk/gotool:d6ce626"
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.com/mvdan/${PN}/archive/${GOLANG_PKG_VERSION}.tar.gz -> ${P}.tar.gz"

inherit golang-single

DESCRIPTION="a Go static analysis tool to find naked returns in functions"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
