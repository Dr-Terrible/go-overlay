# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="honnef.co/go"
GOLANG_PKG_VERSION="33bc4cfe5599e665ab0117ca65e59f254aa6810d"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:0de1eaf"
	"github.com/golang/tools:354f9f8 -> golang.org/x"
	"github.com/dominikh/go-lint:3cb61f0 -> honnef.co/go"
	"github.com/dominikh/go-ssa:1cf7f34 -> honnef.co/go"
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.com/dominikh/go-${PN}/archive/${GOLANG_PKG_ARCHIVEPREFIX}${GOLANG_PKG_VERSION}.tar.gz -> ${P}.tar.gz"

inherit golang-single

DESCRIPTION="Check Go programs for unused identifiers"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_unpack() {
	# Ugly hack to circumvent 'github.com/dominikh/go-unused' as
	# an unusual alias for 'honnef.co/go/unused'.
	local GOLANG_PKG_NAME="go-${PN}"
	golang-single_src_unpack
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"${GOLANG_PKG_IMPORTPATH}/go-lint" \
		"${GOLANG_PKG_IMPORTPATH}/lint"

	golang_fix_importpath_alias \
		"${GOLANG_PKG_IMPORTPATH}/go-ssa" \
		"${GOLANG_PKG_IMPORTPATH}/ssa"
}
