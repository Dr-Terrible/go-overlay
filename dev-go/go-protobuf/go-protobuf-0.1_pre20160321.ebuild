# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_NAME="${PN//go-}"
GOLANG_PKG_VERSION="8d92cf5fc15a4382f8964b08e1f42a75c0591aa3"
GOLANG_PKG_BUILDPATH="/proto /jsonpb /ptypes /protoc-gen-go"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Go support for Google's protocol buffers"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"