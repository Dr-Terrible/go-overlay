# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN//-cli}"
GOLANG_PKG_VERSION="9594d39b82743a3a59dcf4fcefa3aba8a3ae8296"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="SyncThing command-line interface"
HOMEPAGE="https://syncthing.net"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="!net-misc/${PN}"
