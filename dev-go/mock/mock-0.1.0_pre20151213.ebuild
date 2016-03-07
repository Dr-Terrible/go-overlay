# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_VERSION="58a501f87109a45c68afc54e6b1368398678d386"
GOLANG_PKG_BUILDPATH="/${PN}gen"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="GoMock is a mocking framework for the Go programming language"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
