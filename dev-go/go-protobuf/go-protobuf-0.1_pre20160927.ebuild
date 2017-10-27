# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_NAME="${PN//go-}"
GOLANG_PKG_VERSION="df1d3ca07d2d07bba352d5b73c4313b4e2a6203e"
GOLANG_PKG_BUILDPATH="/protoc-gen-go"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="Go support for Google's protocol buffers"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="dev-libs/protobuf:="
