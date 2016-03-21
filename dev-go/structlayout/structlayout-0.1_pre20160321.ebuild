# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/dominikh"
GOLANG_PKG_VERSION="53bd6f5248a2b1d3840037a68217871e165505e6"
GOLANG_PKG_NAME="go-${PN}"
GOLANG_PKG_BUILDPATH="/cmd/${PN} /cmd/${PN}-pretty"
#GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:9360848 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="An utility that prints the layout of a Go struct"
HOMEPAGE="https://github.com/${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
