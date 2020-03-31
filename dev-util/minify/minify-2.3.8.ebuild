# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/tdewolff"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.Commit=2226721"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/tdewolff/parse:e17a589"     #v2.3.5
	"github.com/dustin/go-humanize:9f541cc" #v1.0.0
	"github.com/fsnotify/fsnotify:c282820"  #v1.4.7
	"github.com/golang/sys:66b7b13 -> golang.org/x"
	"github.com/matryer/try:9ac251b"
	"github.com/spf13/pflag:e57e3ee"  #v1.0.0

	# unit testing
	"github.com/tdewolff/test:d8fabc4" #v1.0.0
)

inherit golang-single

DESCRIPTION="Go minifiers for web formats."

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_test() {
	${EGO} test ./... || die
}
