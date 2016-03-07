# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/opennota"
GOLANG_PKG_VERSION="d848db686414d3454ddf1b467fccc3d26b99d3fa"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Transform regular expressions into finite state machines and output GoLang source code"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"
