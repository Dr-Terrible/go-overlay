# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Restic is a program that does backups"
HOMEPAGE="https://restic.github.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RESTRICT+=" test"