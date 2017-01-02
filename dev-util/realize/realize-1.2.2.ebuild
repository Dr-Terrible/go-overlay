# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/tockins"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fatih/color:dea9d3a"        #v1.1.0
	"github.com/fsnotify/fsnotify:629574c"  #v1.4.2
	"github.com/labstack/echo:8d504c1"      #v3.0.3
	"github.com/dgrijalva/jwt-go:d2709f9"   #v3.0.0
	"github.com/labstack/gommon:2d272df"    #v0.1.0
	"github.com/mattn/go-colorable:ed8eb9e" #v0.0.6
	"github.com/mattn/go-isatty:30a891c"
	"github.com/tylerb/graceful:50a48b6"    #v1.2.13
	"github.com/valyala/fasttemplate:3b87495"
	"github.com/urfave/cli:e485446 -> gopkg.in/urfave/cli.v2"
	"github.com/go-yaml/yaml:a5b47d3 -> gopkg.in/yaml.v2"

	"github.com/golang/net:45e7717 -> golang.org/x"
	"github.com/golang/crypto:f6b343c -> golang.org/x"
	"github.com/golang/sys:d75a526 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A Go build system with file watchers, output streams and live reload"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"
