# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/klauspost"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:b5358b5 -> golang.org/x"
	"github.com/sqs/goreturns:6b4ef8a -> sourcegraph.com/sqs"
)

inherit golang-single

DESCRIPTION="Go assembler formatter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
