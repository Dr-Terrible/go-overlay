# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_VERSION="206c0f020eba0f7fbcfbc467a5eb808037df2ed6"
GOLANG_PKG_NAME="${PN/go}"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:354f9f8 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="This is a linter for Go source code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
