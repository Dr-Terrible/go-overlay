# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_VERSION="0b5ba4d9c70dedfb20915518c230f58008fd08d7"
GOLANG_PKG_OUTPUT_NAME="wt"
GOLANG_PKG_BUILDPATH="/wt"
GOLANG_PKG_LDFLAGS="-X github.com/wellington/wellington/version.Version=${PV}"
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="Wellington is a CSS preprocessor with spriting and based on libsass"
HOMEPAGE="http://getwt.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="!dev-go/wellington"
