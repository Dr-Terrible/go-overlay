# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/mvdan"
GOLANG_PKG_IMPORTPATH_ALIAS="mvdan.cc"
GOLANG_PKG_NAME="sh"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A shell parser and formatter for POSIX shell and bash"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
