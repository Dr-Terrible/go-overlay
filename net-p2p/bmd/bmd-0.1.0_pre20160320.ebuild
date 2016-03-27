# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/DanielKrawisz"
GOLANG_PKG_VERSION="fcc13c707a59d15e817569a308f7243eaef2228a"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_GENERATE=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/DanielKrawisz/bmutil:669c809"
	"github.com/DanielKrawisz/maxrate:fae0eea"
	"github.com/boltdb/bolt:ee716d1" #v1.1.0
	"github.com/btcsuite/btcd:cea5d3c" #v0.12.0
	"github.com/golang/protobuf:8d92cf5"
	"github.com/grpc/grpc-go:9e3a674"
	"github.com/jessevdk/go-flags:6b9493b"
	"github.com/golang/crypto:c197bcf -> golang.org/x"
	"github.com/golang/net:35b06af -> golang.org/x"

	"github.com/btcsuite/btclog:5005b72"
	"github.com/btcsuite/btcutil:ff82dac" #v0.5.0
	"github.com/btcsuite/fastsha256:302ad4d"
	"github.com/btcsuite/go-socks:cfe8b59"
	"github.com/btcsuite/golangcrypto:53f62d9"
	"github.com/btcsuite/seelog:313961b"

	# Unit Testing
	"github.com/DanielKrawisz/mocknet:c81c9ee"
	"github.com/ishbir/bmutil:bdbe780 -> github.com/monetas"
)

inherit golang-single

DESCRIPTION="bmd is a collection of Bitmessage tools inspired by btcsuite"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/grpc/grpc-go" \
		"google.golang.org/grpc"
}
