# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/qiuyesuifeng"
GOLANG_PKG_VERSION="9c7286fab5480a703050edd5473668cb93ec1c40"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Goyacc is a version of yacc generating Go parsers."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
