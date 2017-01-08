# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/GoASTScanner"
GOLANG_PKG_VERSION="d4f9b88cbf6b9f190a2425120c9cecc466ec363b"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Inspects golang source code for security problems"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
