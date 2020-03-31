# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_VERSION="bd3c8e81be01eef76d4b503f5e687d2d1354d2d9"
GOLANG_PKG_BUILDPATH="/${PN}gen"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="GoMock is a mocking framework for the Go programming language"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
