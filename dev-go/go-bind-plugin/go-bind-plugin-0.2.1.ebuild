# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/wendigo"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A tool for building Go plugins and generating wrappers around exported symbols"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"

RDEPEND=">=dev-lang/go-1.8"
