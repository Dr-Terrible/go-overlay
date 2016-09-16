# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/alecthomas"
GOLANG_PKG_VERSION="f1391685bb01f7067e6b7b38b761c2b67d67368d"
GOLANG_PKG_NAME="${PN}2"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/droundy/goopt:e5c9ab1"
	"github.com/alecthomas/kingpin:e9044be -> gopkg.in/alecthomas/kingpin.v2"
	"github.com/alecthomas/template:a0175ee"
	"github.com/alecthomas/units:2efee85"
)

inherit golang-single

DESCRIPTION="DevTodo is a small command line application for maintaining lists of tasks."
HOMEPAGE="http://swapoff.org/devtodo.html"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_install() {
	golang-single_src_install

	# rename executable
	mv "${ED}"/usr/bin/${PN} "${ED}"/usr/bin/${PN//dev}2 || die

	# install man pages
	"${GOBIN}"/"${PN}" --help-man > "${T}"/todo2.1 || die
	doman "${T}"/todo2.1
}
