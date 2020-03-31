# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/elwinar"
GOLANG_PKG_LDFLAGS="-X main.VERSION=${PV}"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bradfitz/slice:d9036e2"
	"github.com/client9/xson:71a0e90"
	"github.com/urfave/cli:cfb3883"                #v1.20.0
	"github.com/go-sql-driver/mysql:a0583e0"       #v1.3
	"github.com/imdario/mergo:7fe0c75"             #v0.2.4
	"github.com/lib/pq:83612a5"
	"github.com/mattn/go-sqlite3:ed69081"          #v1.4.0
	"github.com/camlistore/go4:034d17a"
	"github.com/kelseyhightower/envconfig:f611eb3" #v1.3.0
	"github.com/golang/net:a8b9294 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A simple and language-independent SQL schema migration tool"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/camlistore/go4" \
		"go4.org"
}
