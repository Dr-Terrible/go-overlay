# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/laher"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.VERSION ${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/debber/debber-v0.3:d0e314b3cf"
	"github.com/laher/argo:11d91c83cc"
)

inherit golang-single

DESCRIPTION="Goxc is a build tool for GoLange, with a focus on cross-compiling and packaging"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
