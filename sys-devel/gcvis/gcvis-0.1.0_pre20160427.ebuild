# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/davecheney"
GOLANG_PKG_VERSION="43050e7f13c21759904d3bc648b8ad6b6552cf63"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/pkg/browser:9302be2 "
	"github.com/golang/crypto:d172538 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Visualise Go program Garbage Collector trace data in real-time."

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
