# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/walle"
GOLANG_PKG_VERSION="8dc538ef4fe36afbfbdfd86b071fe0cc2651a1e4"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/alexflint/go-arg:aaae155"
)

inherit golang-single

DESCRIPTION="Line length linter, used to enforce line length in files."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND=">=dev-lang/go-1.5.3"
