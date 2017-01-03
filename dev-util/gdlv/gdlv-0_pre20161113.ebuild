# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/aarzilli"
GOLANG_PKG_VERSION="17e31d08f608842ac7a482c3579e332ab3b841ce"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="A graphical frontend to Delve"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
