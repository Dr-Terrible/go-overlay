# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/gordonklaus"
GOLANG_PKG_VERSION="7bae11eba15a3285c75e388f77eb6357a2d73ee2"

inherit golang-single

DESCRIPTION="Detects ineffectual assignments in Go code."

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm"
