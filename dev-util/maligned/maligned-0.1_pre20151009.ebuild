# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/mdempsky"
GOLANG_PKG_VERSION="9600d43b243a85a72db55e1b747b46f73580af64"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:2477c0d -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Detects Go structs that would take less memory if their fields were sorted"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
