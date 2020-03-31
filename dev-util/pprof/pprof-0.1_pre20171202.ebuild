# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_VERSION="63475f227eddd4e1226737100e162c52494c9c49"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/ianlancetaylor/demangle:4883227"
)

inherit golang-single

DESCRIPTION="pprof is a tool for visualization and analysis of profiling data"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE="doc"

src_install() {
	golang-single_src_install

	# this is required to avoid a name conflict with dev-util/google-perftools
	mv "${ED}"/usr/bin/${PN} "${ED}"/usr/bin/go-${PN} || die

	use doc && dodoc -r doc
}

src_test() {
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
