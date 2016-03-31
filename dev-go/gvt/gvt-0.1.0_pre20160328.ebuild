# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/FiloSottile"
GOLANG_PKG_VERSION="09e9f5cb7502ba2c933818d7804dca14f9e11b9d"
#GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_GENERATE=1

inherit golang-single

DESCRIPTION="gvt is the go vendoring tool"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_test() {
	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
