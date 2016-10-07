# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/uber"
GOLANG_PKG_VERSION="e528513674b21732e4321d6a49b395d6a9d3afa2"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/davecgh/go-spew:5215b55"
	"github.com/fatih/color:9aae6aa"
	"github.com/jessevdk/go-flags:1b89bf7"
	"github.com/pmezard/go-difflib:e8554b8"
	"github.com/stretchr/testify:e3a8ff8"
	"github.com/mattn/go-colorable:3dac7b4"
	"github.com/mattn/go-isatty:56b76bd"
	"github.com/golang/sys:833a04a -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Stochastic flame graph profiler for Go Programs"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
