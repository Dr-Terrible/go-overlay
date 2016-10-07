# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/HewlettPackard"
GOLANG_PKG_VERSION="a4fd848bfc1a637604f884c069778643db80a75b"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Inspects golang source code for security problems."

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
