# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/rsc"
GOLANG_PKG_IMPORTPATH_ALIAS="rsc.io"
GOLANG_PKG_VERSION="796d0f2936c29180f709760a9629040e3cc9ff19"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:cc54cd6553 -> golang.org/x"
)
inherit golang-single

DESCRIPTION="Grind rewrites the source files written in GoLang."
HOMEPAGE="http://rsc.io/grind"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
