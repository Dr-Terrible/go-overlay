# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/btcsuite"
GOLANG_PKG_VERSION="62fce1136c04d45ffcfb3a1a240b5dc6dddee17e"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/btcsuite/btcd:cea5d3c" #v0.12.0
	"github.com/btcsuite/btcrpcclient:e6e3b66"
	"github.com/btcsuite/btclog:5005b72"
	"github.com/btcsuite/btcutil:ff82dac" #v0.5.0
	"github.com/btcsuite/fastsha256:302ad4d"
	"github.com/btcsuite/go-socks:cfe8b59"
	"github.com/btcsuite/golangcrypto:53f62d9"
	"github.com/btcsuite/seelog:313961b"
	"github.com/btcsuite/websocket:31079b6"

	# Unit Testing
	"github.com/davecgh/go-spew:5215b55"
)

inherit golang-single

DESCRIPTION="Implements a simulation test driver using the simnet network provided by btcd"
HOMEPAGE="https://btcsuite.github.io"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86 arm"
