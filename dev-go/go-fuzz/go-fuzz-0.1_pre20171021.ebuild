# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/dvyukov"
GOLANG_PKG_VERSION="490b850ac16b7307e047fb1ea3d91dfc5e8154f4"
GOLANG_PKG_BUILDPATH="/${PN} /${PN}-build"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/elazarl/go-bindata-assetfs:30f82fa"
	"github.com/golang/tools:bce7a99 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Go-fuzz is a coverage-guided fuzzing solution for testing of Go packages"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"
