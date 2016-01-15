# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/remyoudompheng"
GOLANG_PKG_VERSION="8d6f14f9328079a542a2431fd4e081da465a66db"
GOLANG_PKG_NAME="go-misc"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Deadcode finds unused Go source code"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RESTRICT+=" test"

PATCHES=(
	"${FILESDIR}"/${PN}.patch
)
