# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/shurcooL"
GOLANG_PKG_VERSION="e400277c2abf67c6ccc69d6d24f55f7bb0749492"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bradfitz/iter:454541e"
	"github.com/kisielk/gotool:58a7a19"
	"github.com/shurcooL/vcsstate:20a6595"
	"github.com/shurcooL/go:63a73a4"
	"github.com/golang/tools:a17fa84 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A command-line tool that show the status of GoLang repositories"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
