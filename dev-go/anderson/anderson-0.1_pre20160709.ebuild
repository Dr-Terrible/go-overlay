# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/contraband"
GOLANG_PKG_VERSION="134c6506bb201ee587d7fcbfe287078c77e3cf42"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Checks your Go dependencies for contraband licenses"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="!dev-util/${PN}"
