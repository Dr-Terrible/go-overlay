# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/elwinar"
GOLANG_PKG_LDFLAGS="-X main.VERSION=${PV}"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bradfitz/slice:d9036e2"
	"github.com/client9/xson:71a0e90"
	"github.com/codegangsta/cli:a14d7d3" #v1.18.1
	"github.com/go-sql-driver/mysql:2a6c607"
	"github.com/imdario/mergo:3e95a51" # v0.2.2
	"github.com/lib/pq:ae8357d"
	"github.com/mattn/go-sqlite3:86681de"
	"github.com/camlistore/go4:399a9d7"
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