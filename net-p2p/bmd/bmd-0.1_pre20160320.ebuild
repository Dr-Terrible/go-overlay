# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/DanielKrawisz"
GOLANG_PKG_VERSION="fcc13c707a59d15e817569a308f7243eaef2228a"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
#	"github.com/btcsuite/btclog:5005b72"
#	"github.com/btcsuite/btcutil:ff82dac" #v0.5.0
#	"github.com/btcsuite/fastsha256:302ad4d"
#	"github.com/btcsuite/go-flags:6c288d6"
#	"github.com/btcsuite/go-socks:cfe8b59"
#	"github.com/btcsuite/golangcrypto:53f62d9"
#	"github.com/btcsuite/goleveldb:1fde62c"
#	"github.com/btcsuite/seelog:313961b"
#	"github.com/btcsuite/snappy-go:0bdef8d"
#	"github.com/btcsuite/websocket:31079b6"
#	"github.com/davecgh/go-spew:5215b55"
)

inherit golang-single

DESCRIPTION="bmd is collection of Bitmessage tools inspired by btcsuite"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

#src_test() {
#	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
#		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
#	fi
#
#	golang-single_src_test
#}
