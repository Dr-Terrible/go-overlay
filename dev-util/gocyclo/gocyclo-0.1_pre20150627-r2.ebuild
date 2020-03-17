# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/fzipp"
GOLANG_PKG_VERSION="6acd4345c835499920e8426c7e4e8d7a34f1bb83"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Calculate cyclomatic complexities of functions in Go source code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

PATCHES=(
	"${FILESDIR}/dont-recurse.patch"
)
