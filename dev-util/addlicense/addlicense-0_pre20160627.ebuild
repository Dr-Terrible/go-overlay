# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_VERSION="04bf3e3e194c338dd2e1e442462c76ba14ed9b2b"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A program which ensures source code files have copyright license headers"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"
