# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/shurcooL"
GOLANG_PKG_VERSION="3e4092d49bb356fb4d202860addbc64b6091a02e"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:d678387370"
	"github.com/shurcooL/go:3cb0bb26e5"
	"github.com/golang/tools:cc54cd6553 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A command-line tool that show the status of GoLang repositories"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"