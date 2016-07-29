# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/alecthomas"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	# Unit Testing
	"github.com/mattn/go-isatty:3a11563" #v0.0.1
	"github.com/alecthomas/repr:f010939"
	"github.com/alecthomas/colour:60882d9"
	"github.com/alecthomas/assert:5c23cad"
	"github.com/client9/gospell:90dfc71"
	"github.com/golang/net:6a513af -> golang.org/x"
	"github.com/sergi/go-diff:ec7fdbb"
)

inherit golang-single

DESCRIPTION="Concurrently run Go lint tools and normalise their output"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="dev-util/go-tools
	dev-util/deadcode
	dev-util/gocyclo
	dev-util/golint
	dev-util/check
	dev-util/errcheck
	dev-util/dupl
	dev-util/ineffassign
	dev-util/interfacer
	dev-util/unconvert
	dev-util/lll
	dev-util/goconst
	dev-go/simple
	dev-util/staticcheck
	dev-util/gas
	dev-go/unused
	dev-util/misspell"
