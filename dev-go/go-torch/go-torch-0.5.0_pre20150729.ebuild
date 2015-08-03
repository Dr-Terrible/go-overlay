# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/uber"
GOLANG_PKG_VERSION="37a3b317cfc518b45321350f00547f366e1e3604"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/Sirupsen/logrus:5701be89e7"
	"github.com/awalterschulze/gographviz:7c3cf72121"
	"github.com/codegangsta/cli:7ad88c2740"
	"github.com/stretchr/objx:cbeaeb16a0"

	# unit testing
	"github.com/stretchr/testify:232e856367"
)

inherit golang-single

DESCRIPTION="Stochastic flame graph profiler for Go Programs"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT="test"