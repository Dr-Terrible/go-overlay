# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/Shopify"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH}/${PN}.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A proxy to simulate network and system conditions"
HOMEPAGE="http://toxiproxy.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="cli"

src_compile() {
	GOLANG_PKG_OUTPUT_NAME="${PN}-server"
	GOLANG_PKG_BUILDPATH="/cmd"
	golang-single_src_compile

	if use cli; then
		GOLANG_PKG_OUTPUT_NAME="${PN}-cli"
		GOLANG_PKG_BUILDPATH="/cli"
		golang-single_src_compile
	fi
}
