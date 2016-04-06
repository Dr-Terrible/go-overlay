# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/galeone"
GOLANG_PKG_VERSION="adcbb96cc1a70c55772ce9d99193acb92b7ac61b"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/ChimeraCoder/gojson:e3edd6d"
	"github.com/nerdzeu/nerdz-api:1591e0b"
)

inherit golang-single

DESCRIPTION="Generates Go structs from JSON server responses"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_test() {
	if has network-sandbox $FEATURES; then
		eerror "Some tests require 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
