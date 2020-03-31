# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/michaelmacinnis"
GOLANG_PKG_VERSION="bb8f89c5420b6b133a8feb679cda6fd6b1082161"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mattn/go-isatty:30a891c"
	"github.com/michaelmacinnis/adapted:0dd5fa3"
	"github.com/peterh/liner:3c5f577"
	"github.com/golang/sys:d75a526 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A surprisingly powerful Unix shell"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
