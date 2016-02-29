# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/davecheney"
GOLANG_PKG_VERSION="01331707332a2dd6995d4564bc82bc3b0eb6f973"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="prdeps prints the dependency graph of a Go package"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
