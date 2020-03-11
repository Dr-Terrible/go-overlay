# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/mdempsky"
GOLANG_PKG_VERSION="95ecdbfc0b5f3e65790c43c77874ee5357ad8a8f"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
	"github.com/golang/text:342b2e1 -> golang.org/x"   #v0.3.2
)

inherit golang-single

DESCRIPTION="Remove unnecessary type conversions from Go source"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
