# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/GoASTScanner"
GOLANG_PKG_VERSION="6de76c92610b387855cdfdd53c99b149928916f7"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Inspects golang source code for security problems"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
