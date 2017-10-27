# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mdempsky"
GOLANG_PKG_VERSION="beb68d938016d2dec1d1b078054f4d3db25f97be"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:5e136de"
	"github.com/golang/tools:b5358b5 -> golang.org/x"
	"github.com/golang/text:ede1cb9 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Remove unnecessary type conversions from Go source"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
