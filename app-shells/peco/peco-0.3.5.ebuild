# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/google/btree:cc6329d427"
	"github.com/jessevdk/go-flags:1b89bf73cd"
	"github.com/mattn/go-runewidth:5890272cd4"
	"github.com/nsf/termbox-go:675ffd907b"
)

inherit golang-single

DESCRIPTION="Simplistic interactive filtering tool"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"