# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/revel"
GOLANG_PKG_NAME="cmd"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/${PN//-cli}"
GOLANG_PKG_OUTPUT_NAME="${PN//-cli}"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/agtorre/gocolorize:f42b554bf7"
	"github.com/revel/revel:67891f91e7"
	"github.com/revel/modules:3589d5bf1d"
	"github.com/robfig/config:0f78529c8c"
	"github.com/robfig/pathtree:41257a1839"
	"github.com/golang/net:669b27b881 -> golang.org/x"
	"github.com/go-fsnotify/fsnotify:8611c35 -> gopkg.in/fsnotify.v1" #v 1.2.9

	# Unit testing
	"github.com/revel/examples:6ecb5d88a4"
)

inherit golang-single

DESCRIPTION="Command-line tool for Revel framework"
HOMEPAGE="http://revel.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
