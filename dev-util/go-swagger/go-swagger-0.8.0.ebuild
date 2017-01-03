# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_BUILDPATH="/cmd/${PN//go-/}"

inherit golang-single

EDOC_COMMIT="98f130337f929aa4bd64feb00ee5a270c3405d7e"

DESCRIPTION="Swagger 2.0 implementation for GoLang"
HOMEPAGE="https://goswagger.io"
SRC_URI+=" doc? ( https://github.com/${PN}/${PN}.github.io/archive/${EDOC_COMMIT}.tar.gz -> ${PN}-docs-${EDOC_COMMIT}.tar.gz )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE+=" doc"

RESTRICT+=" test"

DEPEND="virtual/perl-version
	dev-go/go-bindata"

src_install() {
	golang-single_src_install

	if use doc; then
		pushd "${WORKDIR}"/${PN}.github.io-${EDOC_COMMIT} > /dev/null || die
			docinto html
			dodoc -r "${WORKDIR}"/${PN}.github.io-${EDOC_COMMIT}/*
		popd > /dev/null || die
	fi
}
