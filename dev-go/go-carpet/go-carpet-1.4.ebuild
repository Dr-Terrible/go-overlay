# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/msoap"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/pkg/errors:01fa410" #v0.7.0
	"github.com/mgutz/ansi:c286dce"
	"github.com/golang/tools:c3ce94f -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Shows test coverage for Go source files"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
