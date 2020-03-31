# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/hirokidaichi"
GOLANG_PKG_VERSION="c57591cb2ad9f4c7044be2f6c45d234cafe6c163"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/jessevdk/go-flags:97448c9" # Do not upgrade, see: https://github.com/hirokidaichi/goviz/pull/8
)

inherit golang-single

DESCRIPTION="Goviz is a visualization tool for Golang project dependencies"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
