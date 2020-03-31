# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/pengwynn"
GOLANG_PKG_NAME="flint"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Check your project for common sources of contributor friction"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND="!dev-util/flint
	!dev-go/${PN}"
