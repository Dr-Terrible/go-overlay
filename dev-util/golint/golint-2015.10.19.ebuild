# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_VERSION="32a87160691b3c96046c0c678fe57c5bef761456"
GOLANG_PKG_NAME="${PN/go}"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:fff8fd7 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="This is a linter for Go source code."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${GOLANG_PKG_NAME}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
