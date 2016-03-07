# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_VERSION="${PV//.1/-1}"
GOLANG_PKG_NAME="client"
GOLANG_PKG_BUILDPATH="/go/${PN}"
GOLANG_PKG_TAGS="production"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Client for keybase.io"
HOMEPAGE="https://keybase.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="app-crypt/gnupg"

src_test() {
	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
