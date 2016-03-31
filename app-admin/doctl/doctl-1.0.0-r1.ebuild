# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/digitalocean"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	# Unit Testing
	"github.com/go-fsnotify/fsnotify:875cf42 -> gopkg.in/fsnotify.v1" #v1.2.10
	"github.com/go-check/check:4f90aea -> gopkg.in/check.v1"
)

inherit golang-single

DESCRIPTION="A command line tool for DigitalOcean services"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/go-check/check" \
		"launchpad.net/gocheck"
}

src_test() {
	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
