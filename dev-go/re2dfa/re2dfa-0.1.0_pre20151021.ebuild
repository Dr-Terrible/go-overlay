# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/opennota"
GOLANG_PKG_VERSION="b5f08842adc93990b0f00afd00e97c8c87b53063"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Transforms regexs into finite state machines and output Go source code"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
