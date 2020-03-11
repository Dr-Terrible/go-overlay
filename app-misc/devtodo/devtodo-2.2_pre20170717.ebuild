# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/alecthomas"
GOLANG_PKG_VERSION="b9a81cf5fd8363e72e5af2b6b2bb868c4880a084"
GOLANG_PKG_NAME="${PN}2"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/droundy/goopt:0b8effe"
	"github.com/alecthomas/kingpin:947dcec -> gopkg.in/alecthomas/kingpin.v2"  #v2.2.6
	"github.com/alecthomas/template:fb15b89"
	"github.com/alecthomas/units:f65c72e"
)

inherit golang-single

DESCRIPTION="DevTodo is a small command line application for maintaining lists of tasks."
HOMEPAGE="http://swapoff.org/devtodo.html"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

src_install() {
	golang-single_src_install

	# rename executable
	mv "${ED}"/usr/bin/${PN} "${ED}"/usr/bin/${PN//dev}2 || die

	# install man pages
	"${GOBIN}"/"${PN}" --help-man > "${T}"/todo2.1 || die
	doman "${T}"/todo2.1
}
