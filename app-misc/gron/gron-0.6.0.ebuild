# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/tomnomnom"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.gronVersion=${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fatih/color:3f9d52f"
	"github.com/mattn/go-colorable:efa5899"
	"github.com/mattn/go-isatty:3fb116b"
	"github.com/nwidger/jsoncolor:75a6de4"
	"github.com/pkg/errors:059132a"
)

inherit golang-single

DESCRIPTION="Make JSON greppable!"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE="doc"

src_install() {
	golang-single_src_install
	if use doc; then
		docinto html
		dodoc -r docs/*
	fi
}
