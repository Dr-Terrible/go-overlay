# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_VERSION="6aaf7c34af0f4c36a57e0c429bace4d706d8e931"
GOLANG_PKG_NAME="${PN/go}"
GOLANG_PKG_BUILDPATH="/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:0444735 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="This is a linter for Go source code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
