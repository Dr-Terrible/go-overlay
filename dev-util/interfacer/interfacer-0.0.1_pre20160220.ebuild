# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mvdan"
GOLANG_PKG_VERSION="034ed623e2eb202e0629c9b1c596af8ff0b97878"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:b0452ee -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A linter for GoLang that suggests interface types "
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND=">=dev-lang/go-1.5.0
	!dev-go/${PN}"
