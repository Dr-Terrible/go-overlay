# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/stripe"
GOLANG_PKG_VERSION="452e37ed794488bd0d99676532f346e03cc6cd2c"

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:b5358b5 -> golang.org/x"
)
inherit golang-single

DESCRIPTION="Static analysis tool for GoLang that protects against SQL injections"
#HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
