# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/client9"
GOLANG_PKG_VERSION="b31ae726a3daae256dc74c6b4a87be79cea05be8"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Correct commonly misspelled words in source files"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
