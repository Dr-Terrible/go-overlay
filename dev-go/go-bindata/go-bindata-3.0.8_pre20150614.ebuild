# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/jteeuwen"
GOLANG_PKG_VERSION="91db54b0401d0679b3cf743142e4f3c86b4aaa4e"
GOLANG_PKG_BUILDPATH="/..."
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A small utility for embedding binary data in a GoLang program."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"