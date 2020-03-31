# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/glycerine"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/philhofer/fwd:98c11a7"
	"github.com/golang/tools:908849c -> golang.org/x"
)

inherit golang-single

DESCRIPTION="ZebraPack is a data definition language and serialization format"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

RESTRICT+=" test"
