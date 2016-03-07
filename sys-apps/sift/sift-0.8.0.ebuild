# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/svent"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/svent/go-flags:4bcbad3"
	"github.com/svent/go-nbreader:7cef48d"
	"github.com/golang/crypto:1f22c01 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A fast and powerful open source alternative to grep"
HOMEPAGE="http://sift-tool.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm"
