# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/EconomistDigitalSolutions"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Automatic API generation for Go projects"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
