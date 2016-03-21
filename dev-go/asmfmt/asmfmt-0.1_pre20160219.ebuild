# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/klauspost"
GOLANG_PKG_VERSION="7971758b0c6584f67d745c62d006814ae7b44e9d"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
#GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
#GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:9360848 -> golang.org/x"
	"github.com/sqs/goreturns:b368f1f  -> sourcegraph.com/sqs"
)

inherit golang-single

DESCRIPTION="Go assembler formatter"
HOMEPAGE="https://github.com/${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
