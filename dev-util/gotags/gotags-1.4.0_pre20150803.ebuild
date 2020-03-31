# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/jstemmer"
GOLANG_PKG_VERSION="be986a34e20634775ac73e11a5b55916085c48e7"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="ctags-compatible tag generator for Go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
