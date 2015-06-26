# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/opennota"
GOLANG_PKG_VERSION="46198717c67c61272e2f436414e026b32f20472a"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Transform regular expressions into finite state machines and output GoLang source code"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"