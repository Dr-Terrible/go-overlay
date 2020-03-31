# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/rakyll"
GOLANG_PKG_VERSION="7ba4a57f7ee020859c0b9c527e145206169b44be"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/rakyll/pb:8d46b8b"
	"github.com/golang/net:cfe3c2a -> golang.org/x"
)

inherit golang-single

DESCRIPTION="HTTP(S) load generator, ApacheBench (ab) replacement, written in GoLang"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="!app-benchmarks/boom"
RDEPEND=">=dev-lang/go-1.7.0"
