# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/constabulary"
GOLANG_PKG_VERSION="2893b99ebe15601b1b891fa03a2f0dcd241d724c"
GOLANG_PKG_BUILDPATH="/..."
GOLANG_PKG_MULTIPLE=1

inherit golang-single

DESCRIPTION="Gb is a project based build tool for the Go programming language"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+="test"