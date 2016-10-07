# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_BUILDPATH="/cmd/${PN//go-/}"

inherit golang-single

EDOC_COMMIT="7476660720cd4e2c21f5d1d3552b595666b9aab5"

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

src_prepare() {
	# Fix for documentation
#	pushd "${WORKDIR}"/${PN}.github.io-${EDOC_COMMIT}
#	sed -i \
#		-e "s:href=\"/\":href=\"file\:///usr/share/doc/${PF}/html/index.html\":" \
#		-e "s:about/:about.html:" \
#		-e "s:todo-list/:todo-list.html:" \
#		-e "s:todo-list\":todo-list.html\":" \
#		-e "s:middleware/:middleware.html:" \
#		-e "s:validate/:validate.html:" \
#		-e "s:spec/:spec.html:" \
#		-e "s:meta/:meta.html:" \
#		-e "s:route/:route.html:" \
#		-e "s:params/:params.html:" \
#		-e "s:response/:response.html:" \
#		-e "s:model/:model.html:" \
#		-e "s:allOf/:allOf.html:" \
#		-e "s:strfmt/:strfmt.html:" \
#		-e "s:discriminated/:discriminated.html:" \
#		-e "s:client/:client.html:" \
#		-e "s:server/:server.html:" \
#		-e "s:schemas/:schemas.html:" \
#		-e "s:dynamic/:dynamic.html:" \
#		layouts/partials/navbar.html \
#		layouts/index.html \
#		|| die
#	popd

	# Remove outdated libraries
	# see https://github.com/go-swagger/go-swagger/issues/549
#	rm -r vendor/golang.org/x/tools || die

	golang-single_src_prepare
}

src_install() {
	golang-single_src_install

	if use doc; then
		pushd "${WORKDIR}"/${PN}.github.io-${EDOC_COMMIT}
#			hugo -v \
#				-d "${T}"/docs \
#				--baseURL="file:///usr/share/doc/${PF}/html/" \
#				--canonifyURLs=true \
#				--uglyURLs=true \
#				--disableRSS=true \
#				--disableSitemap=true \
#				--noTimes=true \
#				|| die
			docinto html
			dodoc -r "${WORKDIR}"/${PN}.github.io-${EDOC_COMMIT}/*
		popd
	fi
}
