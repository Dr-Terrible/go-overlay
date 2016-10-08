# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/google/btree:7d79101"
	"github.com/jessevdk/go-flags:4cc2832"
	"github.com/mattn/go-runewidth:d6bea18" #v0.0.1
	"github.com/nsf/termbox-go:b6acae5"
	"github.com/lestrrat/go-pdebug:2e6eaaa"
	"github.com/pkg/errors:17b591d" #v0.7.1
	"github.com/golang/net:71a0359 -> golang.org/x"

	# Unit Testing
	"github.com/stretchr/testify:f390dcf" #v1.1.3
)

inherit golang-single

DESCRIPTION="Simplistic interactive filtering tool"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
