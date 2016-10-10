# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/derekparker"
GOLANG_PKG_VERSION="46803551b888c017e22bef94d6bf223a9eb704a3"
GOLANG_PKG_BUILDPATH="/cmd/dlv"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="Delve is a debugger for the Go programming language"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
