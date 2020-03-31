# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/digitalocean"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	# Unit Testing
	"github.com/go-fsnotify/fsnotify:a8a77c9 -> gopkg.in/fsnotify.v1" #v1.3.1
	"github.com/go-check/check:4f90aea -> gopkg.in/check.v1"
	"github.com/golang/sys:a646d33 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A command line tool for DigitalOcean services"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_prepare() {
	golang-single_src_prepare

	sed -i \
		-e "s:github.com/magiconair/properties/_third_party/gopkg.in/check.v1:gopkg.in/check.v1:" \
		vendor/github.com/magiconair/properties/load_test.go \
		vendor/github.com/magiconair/properties/properties_test.go \
		|| die

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
