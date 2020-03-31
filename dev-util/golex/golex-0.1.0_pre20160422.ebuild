# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/cznic"
GOLANG_PKG_VERSION="da5a7153a51074477ecac5c45a7e5182a0c72448"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/cznic/fileutil:1c9c88f"
	"github.com/cznic/lex:eb696ab"
	"github.com/cznic/lexer:52ae786"
	"github.com/golang/exp:54367eb -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A lex/flex like (not fully POSIX lex compatible) utility"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
