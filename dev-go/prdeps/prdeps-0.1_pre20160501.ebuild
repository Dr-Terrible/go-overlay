# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/davecheney"
GOLANG_PKG_VERSION="e3ad165e217a09917bd8058ce636c9202cd2d7cb"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="prdeps prints the dependency graph of a Go package"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
