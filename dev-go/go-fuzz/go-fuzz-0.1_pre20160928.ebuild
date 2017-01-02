# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/dvyukov"
GOLANG_PKG_VERSION="a1492872285877e5cd4e5e1c3ab91cfde3c89948"
GOLANG_PKG_BUILDPATH="/${PN} /${PN}-build"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/elazarl/go-bindata-assetfs:9a6736e"
	"github.com/golang/tools:b5358b5 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Go-fuzz is a coverage-guided fuzzing solution for testing of Go packages"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"
