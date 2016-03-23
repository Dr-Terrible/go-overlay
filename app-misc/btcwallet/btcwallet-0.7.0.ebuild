# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/btcsuite"
GOLANG_PKG_VERSION="BTCWALLET_0_7_0_ALPHA"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/btcsuite/bolt:1139dd2"
	"github.com/btcsuite/btcd:cea5d3c" #v0.12.0
	"github.com/btcsuite/btclog:5005b72"
	"github.com/btcsuite/btcrpcclient:e6e3b66"
	"github.com/btcsuite/btcutil:ff82dac" #v0.5.0
	"github.com/btcsuite/fastsha256:302ad4d"
	"github.com/btcsuite/go-flags:6c288d6"
	"github.com/btcsuite/go-socks:cfe8b59"
	"github.com/btcsuite/golangcrypto:53f62d9"
	"github.com/btcsuite/seelog:313961b"
	"github.com/btcsuite/websocket:31079b6"

	# Unit Testing
	"github.com/davecgh/go-spew:5215b55"
)

inherit golang-single

DESCRIPTION="A secure bitcoin wallet daemon written in Go"
HOMEPAGE="https://btcsuite.github.io"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DOCS=( CHANGES README.md sample-${PN}.conf )
