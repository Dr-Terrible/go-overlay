# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_IMPORTPATH_ALIAS="golang.org/x"
GOLANG_PKG_NAME="${PN/go-}"
GOLANG_PKG_VERSION="c6efba04dd0d931bb11cd7f556285fa3c9305398"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:daba796  -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Various packages and tools that support the Go programming language"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="!<dev-lang/go-1.6.0"

src_install() {
	golang-single_src_install

	# install binaries in $GOROOT/bin to avoid file collisions
	exeinto "$(go env GOROOT)/bin"
	doexe "${GOBIN}"/*
	rm "${ED}"usr/bin/* || die
	#ln "${ED}$(go env GOROOT)/bin/godoc" "${ED}usr/bin/godoc" || die
	dosym "${ED}$( go en GOROOT )/bin/godoc" /usr/bin/godoc
}
