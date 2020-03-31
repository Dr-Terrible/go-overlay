# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/eandre"
GOLANG_PKG_VERSION="ca2d48e26f6181d4e6686b7b46030116ee37e5bf"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:a8498a7 -> golang.org/x"
)
inherit golang-single

DESCRIPTION="Discover is a utility to aid in conceptualizing large Go code bases"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
