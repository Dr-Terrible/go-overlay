# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mvdan"
GOLANG_PKG_VERSION="caa86469db07ca1f63d5c54e61eb729a57b54889"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:94d5dba"
	"github.com/golang/tools:9e74590 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A linter for GoLang that suggests interface types "

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="!dev-go/${PN}"
