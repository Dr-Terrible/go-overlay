# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mdempsky"
GOLANG_PKG_VERSION="3d66c843b1de9ec7637bc07a9f401fc988a59a98"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:94d5dba"
	"github.com/golang/tools:9e74590 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Remove unnecessary type conversions from Go source"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
