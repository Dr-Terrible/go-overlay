# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/danderson"
GOLANG_PKG_VERSION="36a01778df3498f3cb60d8f457a3809db6b38575"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:669b27b881 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="PXE booting for people in a hurry"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 arm"
