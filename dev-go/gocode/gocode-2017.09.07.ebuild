# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/nsf"
GOLANG_PKG_VERSION="v.${PV//.}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="An autocompletion daemon for the Go programming language"
HOMEPAGE="https://github.com/nsf/gocode"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

RESTRICT+=" test"
