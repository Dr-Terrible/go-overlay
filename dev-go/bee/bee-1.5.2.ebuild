# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/beego"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/astaxie/beego:2d87d4f" #v1.7.1
	"github.com/go-sql-driver/mysql:a732e14" #v1.2
	"github.com/howeyc/fsnotify:f0c08ee"
	"github.com/lib/pq:ae8357d"
	"github.com/smartystreets/goconvey:d4c757a"   #v1.6.2
	"github.com/smartystreets/assertions:e9a2f67" #v1.6.0
	"github.com/go-yaml/yaml:a5b47d3 -> gopkg.in/yaml.v2"
	"github.com/jtolds/gls:8ddce2a" #v4.2.0
)

inherit golang-single

DESCRIPTION="Bee is a tool for helping develop with beego app framework"
HOMEPAGE="http://beego.me"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
