# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/rakyll"
GOLANG_PKG_VERSION="e383bbf6b2ec1a2fb8492dfd152d945fb88919b6"
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="statik embeds static files into a GoLang executable"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
