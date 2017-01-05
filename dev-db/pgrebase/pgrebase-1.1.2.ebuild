# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/oelmekki"
#GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
#GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fsnotify/fsnotify:629574c" #v1.4.2
	"github.com/lib/pq:8df6253"
	"github.com/golang/sys:d75a526 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="PGRebase handles your postgres codebase for functions, triggers and views"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

#src_test() {
#	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
#		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
#	fi
#
#	golang-single_src_test
#}##
