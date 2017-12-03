# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="mvdan.cc"
GOLANG_PKG_VERSION="644240604b3c6d719b0f981ef28cd1168962efb9"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mvdan/lint:adc824a -> mvdan.cc"
	"github.com/kisielk/gotool:d6ce626"
	"github.com/golang/tools:0444735 -> golang.org/x"
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.com/mvdan/${PN}/archive/${GOLANG_PKG_VERSION}.tar.gz -> ${P}.tar.gz"

inherit golang-single

DESCRIPTION="a Go static analysis tool to find naked returns in functions"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
