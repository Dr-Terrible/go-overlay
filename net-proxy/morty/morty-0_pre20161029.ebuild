# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/asciimoo"
GOLANG_PKG_VERSION="4b3c6c59ca8bed7ffd9385e805fc884da4335c15"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/valyala/fasthttp:d42167f" #v20160617
	"github.com/klauspost/compress:8df558b" #1.1
	"github.com/klauspost/cpuid:09cded8" #v1.0
	"github.com/klauspost/crc32:19b0b33" #v1.0
	"github.com/golang/net:541150a -> golang.org/x"
	"github.com/golang/text:2910a50 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Privacy aware web content sanitizer proxy as a service"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
