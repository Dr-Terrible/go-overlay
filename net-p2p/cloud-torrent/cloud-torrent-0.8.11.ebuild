# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/jpillora"
GOLANG_PKG_LDFLAGS="-X main.VERSION=${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Cloud Torrent is a self-hosted remote torrent client, written in GoLang"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
