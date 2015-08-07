# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_IMPORTPATH_ALIAS="golang.org/x"
GOLANG_PKG_NAME="${PN/go-}"
GOLANG_PKG_VERSION="d02228d1857b9f49cd0252788516ff5584266eb6"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:669b27b881 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Go Tools"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="!dev-go/go-tools"
