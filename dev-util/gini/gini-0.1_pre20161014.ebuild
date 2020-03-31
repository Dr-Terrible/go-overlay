# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/irifrance"
GOLANG_PKG_VERSION="0fee6ab777653b71c6d6da5c5172cd29fe590d19"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A fast SAT solver"
HOMEPAGE="http://www.iri-labs.com"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

src_install() {
	golang-single_src_install

	use doc && dodoc doc/crisp/*.pdf
}
