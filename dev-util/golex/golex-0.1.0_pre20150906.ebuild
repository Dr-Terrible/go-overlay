# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/qiuyesuifeng"
GOLANG_PKG_VERSION="74c134d389e5a8399ef33747a748d8ff6d871ac6"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A lex/flex like (not fully POSIX lex compatible) utility"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
