# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/pengwynn"
GOLANG_PKG_VERSION="c3a5d8d9a2e04296fba560d9a22f763cff68eb75"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/codegangsta/cli:142e6cd241"
	"github.com/fatih/color:1b35f289c4"
	"github.com/octokit/go-octokit:4408b5393e"
	"github.com/fhs/go-netrc:4422b68c9c"
	"github.com/jingweno/go-sawyer:1999ae5763"
	"github.com/shiena/ansicolor:264b056680"
	"github.com/jtacoma/uritemplates:0a85813eca"
)

inherit golang-single

DESCRIPTION="Check your project for common sources of contributor friction"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"