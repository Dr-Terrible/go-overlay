# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/stripe"
GOLANG_PKG_VERSION="8c0f8039deab5c83c73c30e2ac85121e1a3cefa5"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
)

inherit golang-single

DESCRIPTION="Static analysis tool for GoLang that protects against SQL injections"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
