# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/tobert"
GOLANG_PKG_VERSION="586f884c0a100f00d704e94d3675de77ef008af9"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/sys:eb2c741 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Page Cache stat: get page cache stats for files on Linux"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
