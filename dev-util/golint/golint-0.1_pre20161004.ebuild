# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_VERSION="55ae771cfa82f3846897c972e262ed5d54d47d48"
GOLANG_PKG_NAME="${PN/go}"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:b5358b5 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="This is a linter for Go source code."

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
