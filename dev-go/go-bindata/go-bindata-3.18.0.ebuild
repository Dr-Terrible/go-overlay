# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# NOTE: The original github.com/jteeuwen/go-bindata is no more maintained.
#       Instead, we use a fork which is API compatible.
#       For more details, see https://github.com/Dr-Terrible/go-overlay/issues/76
GOLANG_PKG_IMPORTPATH="github.com/kevinburke"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A small utility for embedding binary data in a GoLang program."

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="amd64 arm x86"
