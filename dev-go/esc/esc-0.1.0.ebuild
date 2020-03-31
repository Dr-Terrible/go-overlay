# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/mjibson"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="A simple file embedder for Go"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
RESTRICT+=" test"
