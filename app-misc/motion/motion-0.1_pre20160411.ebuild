# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/fatih"
GOLANG_PKG_VERSION="efb4eef465f585649e0a89636e2f2bd6f543482d"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Navigation and insight in Go"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RDEPEND=">=dev-lang/go-1.7.0"
