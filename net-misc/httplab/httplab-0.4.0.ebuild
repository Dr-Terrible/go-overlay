# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/gchaincl"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Interactive cli tool for HTTP inspection"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
