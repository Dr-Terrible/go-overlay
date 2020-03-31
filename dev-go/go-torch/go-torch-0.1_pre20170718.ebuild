# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/uber"
GOLANG_PKG_VERSION="ddbe52cdc30e6a165aee3a634c597e01a235e85e"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fatih/color:570b54c"         #v1.5.0
	"github.com/jessevdk/go-flags:96dc062"   #v1.3.0
)

inherit golang-single

DESCRIPTION="Stochastic flame graph profiler for Go Programs"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
