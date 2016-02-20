# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/mitchellh"
GOLANG_PKG_VERSION="39862d88e853ecc97f45e91c1cdcb1b312c51eaa"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/mitchellh/iochan:87b45ff"
)

inherit golang-single

DESCRIPTION="A dead simple, no frills Go cross compile tool"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
