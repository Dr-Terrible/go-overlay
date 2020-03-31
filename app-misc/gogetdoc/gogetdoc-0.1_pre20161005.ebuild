# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/zmb3"
GOLANG_PKG_VERSION="54e15dfc8cfdb34d9c674721999d302286e85e62"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:b5358b5 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Gets documentation for items in Go source code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RDEPEND=">=dev-lang/go-1.7.0"
