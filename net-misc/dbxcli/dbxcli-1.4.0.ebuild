# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/dropbox"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.version=v${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A command line client for Dropbox built using the Go SDK"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
