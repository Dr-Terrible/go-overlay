# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A tool to list and diagnose Go processes currently running on your system"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
