# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/tdewolff"
GOLANG_PKG_VERSION="a38ec5e5889e1cee6c9800b2b22a695329a8d2ca"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/tdewolff/buffer:7d7d71b"
	"github.com/tdewolff/parse:79bdf70"

	# unit testing
	"github.com/stretchr/testify:232e856367" #v1.0
	"github.com/tdewolff/test:9107f3d"
)

inherit golang-single

DESCRIPTION="Go minifiers for web formats."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
