# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mdempsky"
GOLANG_PKG_VERSION="9b708e0f302568320acd662a90da7e6f80a07e01"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:9e74590 -> golang.org/x"
	"github.com/kisielk/gotool:94d5dba"
)

inherit golang-single

DESCRIPTION="Detects Go structs that would take less memory if their fields were sorted"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
