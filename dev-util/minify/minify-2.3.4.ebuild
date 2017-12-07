# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/tdewolff"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.Commit=2226721"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/tdewolff/parse:639f627" #v2.3.2
	"github.com/dustin/go-humanize:bb3d318"
	"github.com/fsnotify/fsnotify:629574c" #v1.4.2
	"github.com/golang/sys:9167dbf -> golang.org/x"
	"github.com/matryer/try:9ac251b"
	"github.com/spf13/pflag:e57e3ee"  #v1.0.0

	# unit testing
	"github.com/tdewolff/test:26542"
)

inherit golang-single

DESCRIPTION="Go minifiers for web formats."

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_test() {
	${EGO} test ./... || die
}
