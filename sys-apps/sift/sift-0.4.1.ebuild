# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/svent"
GOLANG_PKG_VERSION="b7ac9330abf8ac1979cb6bb6649446a2985cb774"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/svent/go-flags:4bcbad344f"
	"github.com/svent/go-nbreader:7cef48da76"
)

inherit golang-single

DESCRIPTION="A fast and powerful open source alternative to grep"
HOMEPAGE="http://sift-tool.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm"
