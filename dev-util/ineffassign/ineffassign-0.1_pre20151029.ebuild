# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/gordonklaus"
GOLANG_PKG_VERSION="507e48671a072e56dbc5dbbee2872ce0d662697e"

inherit golang-single

DESCRIPTION="Detects ineffectual assignments in Go code."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

#DEPEND=">=dev-lang/go-1.5.1"
