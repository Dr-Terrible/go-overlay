# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="honnef.co/go"
GOLANG_PKG_NAME="${PN//go-/}"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:d6ce626"
	"github.com/golang/tools:0444735 -> golang.org/x"
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.com/dominikh/${PN}/archive/${GOLANG_PKG_VERSION}.tar.gz -> ${P}.tar.gz"

inherit golang-single

DESCRIPTION="Collection of linters and static-analysis tools for Go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_unpack() {
	local GOLANG_PKG_NAME="${PN}"
	golang-single_src_unpack
}
