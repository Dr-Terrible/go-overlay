# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mdempsky"
GOLANG_PKG_VERSION="08c8e9db1bce03f1af283686c0943fcb75f0109e"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:5e136de"
	"github.com/golang/tools:b5358b5 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Detects Go structs that would take less memory if their fields were sorted"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
