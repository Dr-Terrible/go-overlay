# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/client9"
GOLANG_PKG_VERSION="9a1fc2456ac9e8c9b4cbe9d005b6e7adac0d357f"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Correct commonly misspelled words in source files"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
