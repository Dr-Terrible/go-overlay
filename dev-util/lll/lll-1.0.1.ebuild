# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/walle"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/alexflint/go-arg:e71d651"
)

inherit golang-single

DESCRIPTION="Line length linter, used to enforce line length in files."

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
