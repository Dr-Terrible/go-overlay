# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/rakyll"
GOLANG_PKG_VERSION="274df120e9065bdd08eb1120e0375e3dc1ae8465"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="statik embeds static files into a GoLang executable"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT="test"