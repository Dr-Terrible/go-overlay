# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/alfredxing"
GOLANG_PKG_VERSION="1b5495984fff6ac373c06a1b8882ec32259af7c6"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/crypto:d172538 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A simple, fast command-line calculator written in GoLang"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
