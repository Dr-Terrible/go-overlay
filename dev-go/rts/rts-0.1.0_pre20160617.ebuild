# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/galeone"
GOLANG_PKG_VERSION="0cb3c7cfc3df02cbd3f7d2d142c15c22e2239d6f"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/ChimeraCoder/gojson:e3edd6d"
	"github.com/nerdzeu/nerdz-api:ae2b0d5"
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
