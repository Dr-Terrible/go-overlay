# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/direnv"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Direnv is an environment switcher for the shell."
HOMEPAGE="http://direnv.net"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

DEPEND="!dev-go/direnv"

DOCS=( docs/ruby.md )

src_install() {
	golang-single_src_install

	doman "${S}"/man/*.1
}

src_test() {
	golang-single_src_test

	./test/direnv-test.sh || die
}
