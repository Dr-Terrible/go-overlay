# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/danderson"
GOLANG_PKG_VERSION="39919e1a2be6641b76074dcb62d408f738cd7bea"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:b6d7b13 -> golang.org/x"
	"github.com/golang/crypto:1f22c01 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="PXE booting for people in a hurry"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 arm"
