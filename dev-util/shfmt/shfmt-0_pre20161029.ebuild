# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mvdan"
GOLANG_PKG_NAME="sh"
GOLANG_PKG_VERSION="84af269409cb999594b7bac7642aa78bc7df9bdb"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A shell parser and formatter for POSIX shell and bash"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"