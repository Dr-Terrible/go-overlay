# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 python3_{4,5,6,7} )

inherit distutils-r1

DESCRIPTION="Add anchor tags and icons to all headers"
HOMEPAGE="https://pypi.python.org/pypi/${PN}"
SRC_URI="mirror://pypi/m/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

RESTRICT+=" mirror"
