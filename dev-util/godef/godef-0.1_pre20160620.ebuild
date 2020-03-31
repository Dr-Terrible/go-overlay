# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/rogpeppe"
GOLANG_PKG_VERSION="ee532b944160bb27b6f23e4f5ef38b8fdaa2a6bd"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/9fans/go:65b8cf0 -> 9fans.net"
)

inherit golang-single

DESCRIPTION="Godef prints where symbols are defined in Go source code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
