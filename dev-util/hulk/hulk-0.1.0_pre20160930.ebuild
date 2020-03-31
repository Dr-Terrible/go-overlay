# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/jessfraz"
GOLANG_PKG_NAME="junk"
GOLANG_PKG_VERSION="7a34eeee2f5fc396a679311ab0b22b99c24dfdf0"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Ultimate job/build runner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
