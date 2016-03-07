# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/tdewolff"
GOLANG_PKG_VERSION="b3f49b1e31ee2f9e0dcdf31f05f243cb5d87ac56"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/tdewolff/buffer:43cef5b"
	"github.com/tdewolff/parse:926cfdd"
	"github.com/ogier/pflag:45c278a"

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
