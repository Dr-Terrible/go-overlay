# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/ugorji"
GOLANG_PKG_NAME="go"
GOLANG_PKG_VERSION="3487a5545b3d480987dfb0492035299077fab33a"
GOLANG_PKG_BUILDPATH="/codec/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Idiomatic codec and rpc lib for msgpack, cbor, json, etc. msgpack.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
