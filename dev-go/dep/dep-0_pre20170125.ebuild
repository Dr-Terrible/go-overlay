# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_VERSION="3def41597ed40500ea9370262eacac884335e081"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A Go's dependency management tool"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
