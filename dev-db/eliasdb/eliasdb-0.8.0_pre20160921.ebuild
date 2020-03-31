# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/krotik"
GOLANG_PKG_VERSION="3d0dbcfad68a7fe1da41b4ca4e047e5fcad65c4c"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="EliasDB is a graph based database"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE="doc"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"${GOLANG_PKG_IMPORTPATH}/${GOLANG_PKG_NAME}/src/devt.de" \
		"devt.de"
}

src_compile() {
	export GOLANG_PKG_IMPORTPATH_ALIAS="devt.de"
	golang-single_src_compile
}

src_install() {
	golang-single_src_install

	use doc && dodoc -r doc/*
}
