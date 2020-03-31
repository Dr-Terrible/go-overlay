# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/ddollar"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Foreman written in GoLang"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND="!dev-go/${PN}"
