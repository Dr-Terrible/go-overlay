# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_IMPORTPATH_ALIAS="go.universe.tf/netboot"
GOLANG_PKG_NAME="netboot"
GOLANG_PKG_VERSION="57a1c9bea27f5d542444c409a768b331fc5e0cb9"
GOLANG_PKG_BUILDPATH="/pixiecore"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	#"github.com/golang/net:f4b625e -> golang.org/x"
	#"github.com/golang/crypto:1f22c01 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="PXE booting for people in a hurry"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 arm"
