# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mibk"
GOLANG_PKG_VERSION="c450df04426c2f8c35d91fb588feb88fbe328915"

inherit golang-single

DESCRIPTION="A tool for Go code clone detection"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
