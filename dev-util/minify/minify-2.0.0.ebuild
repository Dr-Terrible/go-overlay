# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/tdewolff"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/tdewolff/buffer:0edfcb7"
	"github.com/tdewolff/parse:d049a1b" #v2.0.0
	"github.com/tdewolff/strconv:3e8091f"
	"github.com/dustin/go-humanize:bd88f87"
	"github.com/fsnotify/fsnotify:944cff2" #v1.4.1
	"github.com/matryer/try:c1c8e11"
	"github.com/ogier/pflag:45c278a"
	"github.com/golang/sys:8d1157a -> golang.org/x"

	# unit testing
	"github.com/tdewolff/test:385e27c"
)

inherit golang-single

DESCRIPTION="Go minifiers for web formats."

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
