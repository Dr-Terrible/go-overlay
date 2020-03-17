# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/elazarl"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1

inherit golang-single

DESCRIPTION="A small utility for embedding binary data in a Go program"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
RESTRICT+=" test"

RDEPEND="dev-go/go-bindata"
