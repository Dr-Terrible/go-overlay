# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/walle"
GOLANG_PKG_VERSION="8b13b3fbf7312913fcfdbfa78997b9bd1dbb11af"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/alexflint/go-arg:34b5250"
)

inherit golang-single

DESCRIPTION="Line length linter, used to enforce line length in files."

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
