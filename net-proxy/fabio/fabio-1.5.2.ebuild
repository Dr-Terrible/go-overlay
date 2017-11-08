# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/fabiolb"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Zero-conf load balancer/https router for microservices managed by consul"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
