# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/asciimoo"
GOLANG_PKG_VERSION="4b3c6c59ca8bed7ffd9385e805fc884da4335c15"
#GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
#GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/valyala/fasthttp:d42167f" #v20160617
	"github.com/klauspost/compress:8df558b" #1.1
	"github.com/klauspost/cpuid:09cded8" #v1.0
	"github.com/klauspost/crc32:19b0b33" #v1.0
	"github.com/golang/net:cf4effb -> golang.org/x"
	"github.com/golang/text:2910a50 -> golang.org/x"
	#"github.com/golang/net:541150a -> golang/x"
	#"github.com/golang/text:a8b3843 -> golang/x"
)

inherit golang-single

DESCRIPTION="Privacy aware web content sanitizer proxy as a service"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

#src_test() {
#	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
#		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
#	fi
#
#	golang-single_src_test
#}