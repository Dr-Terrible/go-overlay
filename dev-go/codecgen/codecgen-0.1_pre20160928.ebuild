# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/ugorji"
GOLANG_PKG_NAME="go"
GOLANG_PKG_VERSION="faddd6128c66c4708f45fdc007f575f75e592a3c"
GOLANG_PKG_BUILDPATH="/codec/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Idiomatic codec and rpc lib for msgpack, cbor, json, etc. msgpack.org"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${GOLANG_PKG_NAME}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
