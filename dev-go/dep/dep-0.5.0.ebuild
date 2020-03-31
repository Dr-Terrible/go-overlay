# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/dep"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A Go's dependency management tool"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_test() {
	if has network-sandbox $FEATURES; then
		eerror "Some tests require 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
