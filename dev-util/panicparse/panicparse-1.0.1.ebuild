# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/maruel"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/pp"
GOLANG_PKG_OUTPUT_NAME="${PN}"

inherit golang-single

DESCRIPTION="Parses Go's panic stack traces"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
