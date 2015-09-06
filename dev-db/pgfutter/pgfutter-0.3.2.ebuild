# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/lukasmartinelli"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/cheggaaa/pb:da1f27ad1d"
	"github.com/codegangsta/cli:142e6cd241"
	"github.com/kennygrant/sanitize:bf9c39a678"
	"github.com/lib/pq:b269bd035a"
	"github.com/golang/net:669b27b881 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Command-line tool to import CSV and JSON into PostgreSQL"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"