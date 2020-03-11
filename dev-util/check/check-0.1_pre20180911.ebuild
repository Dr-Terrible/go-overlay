# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/opennota"
GOLANG_PKG_VERSION="0c771f5545ff495a81aad2916c3f16add0cd3b55"
GOLANG_PKG_BUILDPATH="/cmd/aligncheck /cmd/structcheck /cmd/varcheck"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:8051706"                #v1.0.0
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
)

inherit golang-single

DESCRIPTION="A set of utilities for checking Go sources"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"
