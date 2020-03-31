# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/schollz"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A feature-rich wiki webserver for minimalists"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND="dev-go/go-bindata"

src_compile() {
	emake bindata.go || die
	golang-single_src_compile
}
