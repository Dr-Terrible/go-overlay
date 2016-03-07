# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/cznic"
GOLANG_PKG_VERSION="980542a2d456ec78fc73a405f5f4063849ae8028"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/cznic/golex:a799639"
	"github.com/cznic/mathutil:1dc7462"
	"github.com/cznic/parser:0229b9c"
	"github.com/cznic/sortutil:e14776c"
	"github.com/cznic/strutil:1eb03e3"
	"github.com/cznic/y:14e7b5d"
)

inherit golang-single

DESCRIPTION="Goyacc is a version of yacc generating Go parsers."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
