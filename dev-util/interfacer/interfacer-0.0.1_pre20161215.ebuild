# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mvdan"
GOLANG_PKG_VERSION="588bd9940e912b1b2760d41bd836ef28ff97164d"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:0de1eaf"
	"github.com/golang/tools:354f9f8 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A linter for GoLang that suggests interface types "

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="!dev-go/${PN}"
