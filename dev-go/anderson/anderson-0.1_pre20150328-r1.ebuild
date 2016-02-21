# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/xoebus"
GOLANG_PKG_VERSION="1a5c7cc1705c9b10ceb37491cf4b35545eb83485"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Checks your Go dependencies for contraband licenses"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="!dev-util/${PN}"
