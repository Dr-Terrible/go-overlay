# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/tockins"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/pkg/errors:645ef00"         #v0.8.0
	"github.com/sirupsen/logrus:f006c2a"    #v1.0.3
	"github.com/fatih/color:1535ebc"
	"github.com/fsnotify/fsnotify:4da3e2c"
	"github.com/labstack/echo:a625e58"
	"github.com/dgrijalva/jwt-go:d2709f9"   #v3.0.0
	"github.com/labstack/gommon:779b8a8"    #v0.2.2
	"github.com/mattn/go-colorable:167de6b" #v0.0.9
	"github.com/mattn/go-isatty:fc9e8d8"    #v0.0.2
	"github.com/moby/moby:092cba3"          #v1.13.1
	"github.com/tockins/interact:620e305"
	"github.com/valyala/bytebufferpool:e746df9"
	#"github.com/tylerb/graceful:50a48b6"    #v1.2.13
	"github.com/valyala/fasttemplate:dcecefd"
	"github.com/urfave/cli:50a0fde -> gopkg.in/urfave/cli.v2"
	"github.com/go-yaml/yaml:eb3733d -> gopkg.in/yaml.v2"
	"github.com/golang/net:0744d00 -> golang.org/x"
	"github.com/golang/crypto:7d9177d -> golang.org/x"
	"github.com/golang/sys:429f518 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A Go build system with file watchers, output streams and live reload"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"
