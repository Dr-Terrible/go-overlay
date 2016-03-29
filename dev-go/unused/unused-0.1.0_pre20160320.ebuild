# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="honnef.co/go"
GOLANG_PKG_VERSION="16cf7f968ef7ba0cabb3f004ad0679d25077d1a1"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:0ed9f24 -> golang.org/x"
	"github.com/kisielk/gotool:58a7a19"
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.comdominikh/go-${PN}/archive/${GOLANG_PKG_ARCHIVEPREFIX}${GOLANG_PKG_VERSION}${GOLANG_PKG_ARCHIVESUFFIX} -> ${P}${GOLANG_PKG_ARCHIVESUFFIX}"

inherit golang-single

DESCRIPTION="Check Go programs for unused identifiers"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_unpack() {
	# Ugly hack to circumvent 'github.com/dominikh/go-unused' as
	# an unusual alias for 'honnef.co/go/unused'.
	local GOLANG_PKG_NAME="go-${PN}"
	golang-single_src_unpack
}