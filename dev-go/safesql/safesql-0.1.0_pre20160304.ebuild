# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/stripe"
GOLANG_PKG_VERSION="452e37ed794488bd0d99676532f346e03cc6cd2c"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:0444735 -> golang.org/x"
)
inherit golang-single

DESCRIPTION="Static analysis tool for GoLang that protects against SQL injections"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
