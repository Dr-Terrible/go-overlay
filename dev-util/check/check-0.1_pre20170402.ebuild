# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/opennota"
GOLANG_PKG_VERSION="11e2eec79ec4f789607e3efbf405cdca2504d4cb"
GOLANG_PKG_BUILDPATH="/cmd/aligncheck /cmd/structcheck /cmd/varcheck"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:d6ce626"
	"github.com/golang/tools:0444735 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A set of utilities for checking Go sources "

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm"
