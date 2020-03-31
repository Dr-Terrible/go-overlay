# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/aktau"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/dustin/go-humanize:8929fe9"
	"github.com/voxelbrain/goptions:26cb8b0" #v2.5.11
)

inherit golang-single

DESCRIPTION="CLI to create and edit releases on Github"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
