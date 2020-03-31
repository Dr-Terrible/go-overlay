# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/FiloSottile"
GOLANG_PKG_VERSION="50d83ea21cb0405e81efd284951e111b3a68d701"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="gvt is a simple vendoring tool made for Go native vendoring"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_test() {
	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
