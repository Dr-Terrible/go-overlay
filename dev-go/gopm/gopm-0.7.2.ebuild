# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/gpmgo"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/Unknwon/cae:7f5e046"
	"github.com/Unknwon/com:28b053d"
	"github.com/Unknwon/goconfig:5f601ca"
	"github.com/aybabtme/color:28ad4cc"
	"github.com/codegangsta/cli:27ecc97" #v1.1.0
)

inherit golang-single

DESCRIPTION="Gopm is a package manager and build tool for Go"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
