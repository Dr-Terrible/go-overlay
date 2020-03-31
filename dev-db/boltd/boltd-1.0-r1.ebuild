# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/boltdb"
GOLANG_PKG_VERSION="1f04e2021e45203042db17ab1323577452a90350"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/boltdb/bolt:ee716d1"
)

inherit golang-single

DESCRIPTION="Bolts is a introspection tool for Bolt databases."

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
