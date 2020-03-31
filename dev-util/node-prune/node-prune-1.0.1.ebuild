# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/tj"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/apex/log:0296d6e"
	"github.com/pkg/errors:8842a6e"
	"github.com/dustin/go-humanize:bb3d318"
)

inherit golang-single

DESCRIPTION="Remove unnecessary files from node_modules"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
