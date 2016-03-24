# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/DanielKrawisz"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
#GOLANG_PKG_USE_GENERATE=1

inherit golang-live

DESCRIPTION="bmd is a collection of Bitmessage tools inspired by btcsuite"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

# TODO: dependency required by go:generate
#DEPEND="dev-libs/protobuf:3"
