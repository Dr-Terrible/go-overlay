# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/sosedoff"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Cross-platform client for PostgreSQL databases"
HOMEPAGE="http://sosedoff.github.io/pgweb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND="dev-go/go-bindata"

src_prepare() {
	golang-single_src_prepare

	# build assets
	emake assets || die
}
