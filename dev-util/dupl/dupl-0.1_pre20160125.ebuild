# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/mibk"
GOLANG_PKG_VERSION="47b66d6a523fb992d21bc375c1a2fef7320ccaa1"

inherit golang-single

DESCRIPTION="A tool for Go code clone detection"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
