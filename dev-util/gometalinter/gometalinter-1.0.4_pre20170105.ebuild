# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/alecthomas"
GOLANG_PKG_VERSION="4219e1bc9da538fa447777301fb5c0ab795eb990"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/google/shlex:6f45313"
	"github.com/alecthomas/kingpin:e9044be -> gopkg.in/alecthomas/kingpin.v2" #v2.2.3
	"github.com/alecthomas/kingpin:4b6d769 -> gopkg.in/alecthomas/kingpin.v3-unstable"
	"github.com/alecthomas/template:a0175ee"
	"github.com/alecthomas/units:2efee85"

	# Unit Testing
	"github.com/stretchr/testify:69483b4" #v1.1.4
)

inherit golang-single

DESCRIPTION="Concurrently run Go lint tools and normalise their output"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="dev-go/go-tools
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
