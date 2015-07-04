# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/gogo"
GOLANG_PKG_VERSION="64f27bf06efee53589314a6e5a4af34cdd85adf6"
GOLANG_PKG_IS_MULTIPLE=1

GOLANG_PKG_DEPENDENCIES=(
)

inherit golang-single

DESCRIPTION="Protocol Buffers for Go with Gadgets"
HOMEPAGE="http://gogo.github.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

# Tests must be executed AFTER the src_install() phase,
# which is not supported by emerge.
RESTRICT+=" test"

DEPEND="dev-libs/protobuf"