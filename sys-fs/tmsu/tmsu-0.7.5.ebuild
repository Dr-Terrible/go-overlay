# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/oniony"
GOLANG_PKG_NAME="TMSU"
GOLANG_PKG_OUTPUTNAME="${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/hanwen/go-fuse:e9498b6"              #v2.0.2
	"github.com/mattn/go-sqlite3:9bdaffc"            #v2.0.3
	"github.com/golang/sys:5c8b2ff -> golang.org/x"
)

inherit golang-single

DESCRIPTION="github.com/oniony/TMSU/releases"
HOMEPAGE="https://tmsu.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"

RESTRICT+=" test"

src_compile() {
	emake compile || die
}
src_install() {
	emake install DESTDIR="${D}" || die
}
