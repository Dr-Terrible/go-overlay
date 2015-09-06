# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/stripe"
GOLANG_PKG_VERSION="9fcb7be12dfcbef68bd78acd116e2065cd0b3482"

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:cc54cd6553 -> golang.org/x"
)
inherit golang-single

DESCRIPTION="Static analysis tool for GoLang that protects against SQL injections"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"