# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/cznic"
GOLANG_PKG_VERSION="4faa926f4f7cf4b7c9852a0bd2aae89d617f7d38"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/cznic/golex:da5a715"
	"github.com/cznic/mathutil:78ad7f2"
	"github.com/cznic/parser:31edd92"
	"github.com/cznic/sortutil:4c73428"
	"github.com/cznic/strutil:1eb03e3"
	"github.com/cznic/y:938f8e8"
)

inherit golang-single

DESCRIPTION="Goyacc is a version of yacc generating Go parsers."

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
