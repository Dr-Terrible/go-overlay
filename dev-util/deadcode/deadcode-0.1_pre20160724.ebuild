# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/tsenart"
GOLANG_PKG_VERSION="210d2dc333e90c7e3eedf4f2242507a8e83ed4ab"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Deadcode finds unused Go source code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
