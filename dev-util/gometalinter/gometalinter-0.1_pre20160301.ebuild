# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/alecthomas"
GOLANG_PKG_VERSION="5ba5353545d7d13bcb10d7ca58c45e026a99a58d"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/alecthomas/kingpin:8cccfa8 -> gopkg.in/alecthomas/kingpin.v2" #v2.1.11
	"github.com/alecthomas/template:14fd436"
	"github.com/alecthomas/units:2efee85"
	"github.com/stretchr/testify:f390dcf" #v1.1.3
	"github.com/google/shlex:6f45313"

	# Unit Testing
	"github.com/davecgh/go-spew:5215b55"
	"github.com/pmezard/go-difflib:792786c"
)

inherit golang-single

DESCRIPTION="Concurrently run Go lint tools and normalise their output"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

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
	dev-util/goconst"
