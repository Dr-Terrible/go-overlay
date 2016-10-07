# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/FiloSottile"
GOLANG_PKG_VERSION="1f87bb350317842680fd7e0fdec64b4e14c79576"
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
