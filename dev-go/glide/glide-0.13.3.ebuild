# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/Masterminds"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"

inherit golang-single

DESCRIPTION="Glide is a vendor Package Management for Golang"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

RESTRICT+=" test"
