# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/jgautheron"
GOLANG_PKG_VERSION="d188494464771f90d306fe046392f3d121798fbd"
GOLANG_PKG_HAVE_TEST=1
#GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="Find repeated strings that could be replaced by a constant."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
