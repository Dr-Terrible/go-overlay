# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/dvyukov"
GOLANG_PKG_VERSION="7076fcda38ec4a894e08ae5558cfa84288f60a25"
GOLANG_PKG_BUILDPATH="/${PN} /${PN}-build"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/elazarl/go-bindata-assetfs:57eb5e1"
	"github.com/golang/tools:a17fa84 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Go-fuzz is a coverage-guided fuzzing solution for testing of Go packages"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"

DEPEND=">=dev-lang/go-1.5.1"
