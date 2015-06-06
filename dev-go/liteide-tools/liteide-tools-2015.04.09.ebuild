# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/visualfc"
GOLANG_PKG_NAME="gotools"
GOLANG_PKG_VERSION="b8348693492ca3791bccfa028f3c19634c11c5b5"
GOLANG_PKG_INSTALLPATH="/opt/liteide"

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:cc54cd6553 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Liteide Golang tools"
HOMEPAGE="https://github.com/visualfc/gotools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE="test"