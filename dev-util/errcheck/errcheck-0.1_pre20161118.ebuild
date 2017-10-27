# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/kisielk"
GOLANG_PKG_VERSION="db0ca22445717d1b2c51ac1034440e0a2a2de645"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:0de1eaf"
	"github.com/golang/tools:354f9f8 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Errcheck checks that you checked errors"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="!dev-go/${PN}"
