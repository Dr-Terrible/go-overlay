# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/alexkohler"
GOLANG_PKG_VERSION="c32aa56f68ec30356104ef32aa162cc7be83acda"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Go static analysis tool to find slice declarations that could potentially be preallocated"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
