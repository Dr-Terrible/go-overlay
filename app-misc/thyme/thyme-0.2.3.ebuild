# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/sourcegraph"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/jessevdk/go-flags:4cc2832"
)

inherit golang-single

DESCRIPTION="Automatically track which applications you use and for how long"
HOMEPAGE="https://sourcegraph.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 -arm x86"

RDEPEND="x11-apps/xdpyinfo
	x11-apps/xwininfo
	x11-misc/xdotool
	x11-misc/wmctrl"
