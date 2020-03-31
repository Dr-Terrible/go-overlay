# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/bouk"
GOLANG_PKG_VERSION="7a61f20aea9440c19194e7eec4ca6bea7bb63c1f"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="staticfiles compiles a directory of files into an embeddable .go file"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
