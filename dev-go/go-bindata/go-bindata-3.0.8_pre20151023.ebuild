# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/jteeuwen"
GOLANG_PKG_VERSION="a0ff2567cfb70903282db057e799fd826784d41d"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A small utility for embedding binary data in a GoLang program."

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
