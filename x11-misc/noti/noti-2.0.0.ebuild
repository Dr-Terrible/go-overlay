# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/variadico"
GOLANG_PKG_ARCHIVEPREFIX="v"

inherit golang-single

DESCRIPTION="Display a notification when a terminal process finishes. "
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RESTRICT+=" test"

RDEPEND="x11-libs/libnotify
	app-accessibility/espeak"
