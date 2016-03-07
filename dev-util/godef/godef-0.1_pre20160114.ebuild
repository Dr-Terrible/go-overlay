# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/rogpeppe"
GOLANG_PKG_VERSION="f90a99664522cad305e072e594a262ae1fcdd256"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/9fans/go:65b8cf0 -> 9fans.net"
)

inherit golang-single

DESCRIPTION="Godef prints where symbols are defined in Go source code"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
