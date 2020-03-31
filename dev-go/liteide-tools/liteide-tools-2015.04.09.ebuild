# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/visualfc"
GOLANG_PKG_NAME="gotools"
GOLANG_PKG_VERSION="b8348693492ca3791bccfa028f3c19634c11c5b5"
GOLANG_PKG_INSTALLPATH="/opt/liteide"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:cc54cd6553 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Liteide Golang tools"
HOMEPAGE="https://github.com/visualfc/gotools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
