# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/gordonklaus"
GOLANG_PKG_VERSION="cb7fbaf18166b1f12a02c381e89ab5ce538a02ec"

inherit golang-single

DESCRIPTION="Detects ineffectual assignments in Go code."

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm"
