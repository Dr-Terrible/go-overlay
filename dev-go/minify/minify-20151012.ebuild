# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/tdewolff"
GOLANG_PKG_VERSION="6ba1048de80217e603f7044caa5c125c5012b560"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/tdewolff/buffer:8ff0a82a07"
	"github.com/tdewolff/parse:be9d09681b"

	# unit testing
	"github.com/stretchr/testify:232e856367"
)

inherit golang-single

DESCRIPTION="Go minifiers for web formats."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
