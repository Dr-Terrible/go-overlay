# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/alecthomas"
GOLANG_PKG_VERSION="c091e0a4c38d2ab6bece06f76c8f10f4c4ddd5b7"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/alecthomas/kingpin:6e0b900 -> gopkg.in/alecthomas/kingpin.v2"
	"github.com/alecthomas/template:b867cc6"
	"github.com/alecthomas/units:2efee85"
	"github.com/stretchr/testify:232e856367" #v1.0
)

inherit golang-single

DESCRIPTION="Concurrently run Go lint tools and normalise their output"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

# TODO: add all the supported linters as RDEPENDS
RDEPEND="dev-util/go-tools
	dev-util/gocyclo
	dev-util/golint"
