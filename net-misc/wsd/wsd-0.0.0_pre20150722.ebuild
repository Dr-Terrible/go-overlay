# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/alexanderGugel"
GOLANG_PKG_VERSION="21c610ac23687c7d5dca9a2b7c149f7c8e23f091"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fatih/color:1b35f289c4"
	"github.com/golang/net:669b27b881 -> golang.org/x"
	"github.com/shiena/ansicolor:264b056680"
)
inherit golang-single

DESCRIPTION="Simple cURL-like command line utility for debugging WebSocket servers"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
