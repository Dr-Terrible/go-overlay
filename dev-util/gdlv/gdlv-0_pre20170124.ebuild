# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/aarzilli"
GOLANG_PKG_VERSION="a9a6f916b786b0a8a69a63d568e5b76de2f23400"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="A graphical frontend to Delve"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
