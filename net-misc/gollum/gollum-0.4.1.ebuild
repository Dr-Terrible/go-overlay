# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/trivago"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	# Fix compilation errors due to outdated dependencis in Godeps
	"github.com/mattbaird/elastigo:bd9e895"
	"github.com/araddon/gou:101410571b"
)

inherit golang-single

DESCRIPTION="A n:m message multiplexer written in GoLang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE+=" doc"

DEPEND="doc? ( >=dev-python/sphinx-1.3.1 )"

src_install() {
	golang-single_src_install

	# Install configuration files
	keepdir /etc/${PN}
	insinto /etc/${PN}
	for CONF in "${S}"/config/*; do
		doins ${CONF}
	done

	# Install documentation
	if use doc; then
		pushd "${S}"/docs > /dev/null || die
			sphinx-build -a \
				-b html \
				-d _build/doctrees \
				. _build/html || die
			dohtml -r _build/html/*
		popd > /dev/null || die
	fi
}
