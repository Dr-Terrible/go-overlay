# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/apex"
GOLANG_PKG_OUTPUT_NAME="${PN}-docs"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}-docs"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/PuerkitoBio/goquery:a86ea07"  #v1.4.0
	"github.com/alecthomas/chroma:3020e2e"    #v0.4.0
	"github.com/alecthomas/template:a0175ee"
	"github.com/alecthomas/units:2efee85"
	"github.com/apex/log:ff0f669"
	"github.com/pkg/errors:645ef00"           #v0.8.0
	"github.com/russross/blackfriday:55d61fa" #v1.5.1
	"github.com/segmentio/go-snakecase:af59cb3"
	"github.com/tj/front:739be21"
	"github.com/tj/kingpin:7efc93b"           #v2.5.0
	"github.com/andybalholm/cascadia:901648c" #v1.0.0
	"github.com/danwakefield/fnmatch:cbb64ac"
	"github.com/dlclark/regexp2:487489b"      #v1.1.6
	"github.com/fatih/color:507f605"          #v1.6.0
	"github.com/mattn/go-colorable:167de6b"   #v0.0.9
	"github.com/mattn/go-isatty:0360b2a"      #v0.0.3
	"github.com/go-yaml/yaml:9f9df34 -> gopkg.in/yaml.v1"
	"github.com/golang/net:61147c4 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="The static site anti-framework"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
