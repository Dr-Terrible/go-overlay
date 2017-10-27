# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/dominikh"
GOLANG_PKG_VERSION="504fdf06ef5c0d83a29c594b3a169af68b9c2e14"
GOLANG_PKG_NAME="go-${PN}"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:9360848 -> golang.org/x"
	"github.com/dominikh/gcsizes:776fa68 -> honnef.co/go"
	"github.com/ajstarks/svgo:672fe54"
)

inherit golang-single

DESCRIPTION="An utility that prints the layout of a Go struct"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${GOLANG_PKG_NAME}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="svg"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/dominikh/${GOLANG_PKG_NAME}" \
		"honnef.co/go/${PN}"
}

src_compile() {
	golang-single_src_compile

	# Build structlayout-svg
	if use svg; then
		GOLANG_PKG_BUILDPATH="/../../../github.com/ajstarks/svgo/${PN}-svg"
		golang-single_src_compile

		# Restore the previous build path
		GOLANG_PKG_BUILDPATH="/..."
	fi
}
