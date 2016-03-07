# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/cznic"
GOLANG_PKG_VERSION="0f61a5abc4fb10befbe363d5795b71d599faaf6e"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/cznic/fileutil:7310918"
	"github.com/cznic/lex:eb696ab"
	"github.com/cznic/lexer:52ae786"
	"github.com/golang/exp:d00e13e -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A lex/flex like (not fully POSIX lex compatible) utility"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
