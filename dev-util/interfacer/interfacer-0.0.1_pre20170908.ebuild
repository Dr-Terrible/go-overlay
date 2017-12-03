# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="mvdan.cc"
GOLANG_PKG_VERSION="d7e7372184a059b8fd99d96a593e3811bf989d75"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mvdan/lint:adc824a -> mvdan.cc"
	"github.com/kisielk/gotool:d6ce626"
	"github.com/golang/tools:0444735 -> golang.org/x"
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
