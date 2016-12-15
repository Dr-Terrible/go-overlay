# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/keybase/go-ps:668c885"
	"github.com/golang/arch:c49399f -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A tool to list and diagnose Go processes currently running on your system"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
