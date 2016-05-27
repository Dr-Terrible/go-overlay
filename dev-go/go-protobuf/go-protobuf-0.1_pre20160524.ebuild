# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_NAME="${PN//go-}"
GOLANG_PKG_VERSION="9e6977f30c91c78396e719e164e57f9287fff42c"
GOLANG_PKG_BUILDPATH="/protoc-gen-go"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="Go support for Google's protocol buffers"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="dev-libs/protobuf:="
