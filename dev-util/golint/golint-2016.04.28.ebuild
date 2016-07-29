# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_VERSION="c7bacac2b21ca01afa1dee0acf64df3ce047c28f"
GOLANG_PKG_NAME="${PN/go}"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:9e74590 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="This is a linter for Go source code."

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
