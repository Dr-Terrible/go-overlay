# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/lukasmartinelli"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/cheggaaa/pb:9453b2d" #v1.0.5
	"github.com/urfave/cli:a14d7d3 -> github.com/codegangsta" #v1.18.1
	"github.com/kennygrant/sanitize:ce9fd1f" #v1.0
	"github.com/lib/pq:50761b0"
	"github.com/golang/net:71a0359 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Command-line tool to import CSV and JSON into PostgreSQL"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
