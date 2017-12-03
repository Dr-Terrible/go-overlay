# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/kisielk"
GOLANG_PKG_VERSION="b1445a9dd8285a50c6d1661d16f0a9ceb08125f7"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:d6ce626"
	"github.com/golang/tools:0444735 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Errcheck checks that you checked errors"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="!dev-go/${PN}"
