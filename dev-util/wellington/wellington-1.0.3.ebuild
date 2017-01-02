# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_VERSION="5150d4a4c3beeea15358d205678a02d166ba913f"
GOLANG_PKG_OUTPUT_NAME="wt"
GOLANG_PKG_BUILDPATH="/wt"
GOLANG_PKG_LDFLAGS="-X github.com/wellington/wellington/version.Version=${PV}"
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:f4b625e -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Wellington is a CSS preprocessor with spriting and based on libsass"
HOMEPAGE="http://getwt.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="!dev-go/wellington"
