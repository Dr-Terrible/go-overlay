# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mitchellh"
GOLANG_PKG_VERSION="c9740af9c6574448fd48eb30a71f964014c7a837"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/mitchellh/iochan:87b45ff"
)

inherit golang-single

DESCRIPTION="A dead simple, no frills Go cross compile tool"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
