# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/davecheney"
GOLANG_PKG_VERSION="c6e7d3ef891c623d139d68c176579951682c4d81"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/pkg/browser:3bc3fa0b3a"
)

inherit golang-single

DESCRIPTION="Visualise Go program Garbage Collector trace data in real-time."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
