# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/astaxie"
GOLANG_PKG_VERSION="0.0.1" # upstream has mistakly released v0.1.0 as v0.0.1
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Go implemented CLI cURL-like tool for humans"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND="!sys-apps/bat"
