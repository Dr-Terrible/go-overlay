# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# NOTE: the original github.com/jteeuwen/go-bindata is no more maintained.
#       We use a fork: github.com/shuLhan/go-bindata.
#       See https://github.com/jteeuwen/go-bindata/issues/165
GOLANG_PKG_IMPORTPATH="github.com/shuLhan"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A small utility for embedding binary data in a GoLang program."

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
