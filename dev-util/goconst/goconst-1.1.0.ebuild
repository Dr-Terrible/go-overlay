# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/jgautheron"
#GOLANG_PKG_VERSION="6a7633b712b6fb1d6821d33851d086a1d545dacd"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Find repeated strings that could be replaced by a constant."

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
