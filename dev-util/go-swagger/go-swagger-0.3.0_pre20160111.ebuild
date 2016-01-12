# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_VERSION="da4fb18bad3ebe9a1371d316137be199fb5bdaa4"
GOLANG_PKG_BUILDPATH="/cmd/${PN//go-/}"
#GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	# Unit Testing
#	"github.com/naoina/denco:9af2ba0"
#	"github.com/go-swagger/scan-repo-boundary:196ec52"
#	"github.com/golang/net:2cba614 -> golang.org/x"
#	"github.com/asaskevich/govalidator:5fe52de" #v2
#	"github.com/onsi/ginkgo:462326b" #v1.2.0
#	"github.com/onsi/gomega:0fe2044"
#	"github.com/codegangsta/negroni:c7477ad"
#	"github.com/smartystreets/assertions:edb6e29"
#	"github.com/go-check/check:4f90aea -> gopkg.in/check.v1"
#	"github.com/golang/tools:4f50f44d7a -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Swagger 2.0 implementation for GoLang"
HOMEPAGE="https://goswagger.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE+=" doc"

RESTRICT+=" test"

DEPEND=">=dev-lang/go-1.5.1
	virtual/perl-version
	dev-go/go-bindata
	doc? ( www-apps/hugo )"

src_prepare() {
	sed -i \
		-e "s:href=\"/\":href=\"file\:///usr/share/doc/${PF}/html/index.html\":" \
		-e "s:about/:about.html:" \
		-e "s:todo-list/:todo-list.html:" \
		-e "s:todo-list\":todo-list.html\":" \
		-e "s:middleware/:middleware.html:" \
		-e "s:validate/:validate.html:" \
		-e "s:spec/:spec.html:" \
		-e "s:meta/:meta.html:" \
		-e "s:route/:route.html:" \
		-e "s:params/:params.html:" \
		-e "s:response/:response.html:" \
		-e "s:model/:model.html:" \
		-e "s:allOf/:allOf.html:" \
		-e "s:strfmt/:strfmt.html:" \
		-e "s:discriminated/:discriminated.html:" \
		-e "s:client/:client.html:" \
		-e "s:server/:server.html:" \
		-e "s:schemas/:schemas.html:" \
		-e "s:dynamic/:dynamic.html:" \
		docs/layouts/partials/navbar.html \
		docs/layouts/index.html \
		|| die
	golang-single_src_prepare
}

src_install() {
	golang-single_src_install

	if use doc; then
		pushd docs
			hugo -v \
				-d "${T}"/docs \
				--baseURL="file:///usr/share/doc/${PF}/html/" \
				--canonifyURLs=true \
				--uglyURLs=true \
				--disableRSS=true \
				--disableSitemap=true \
				--noTimes=true \
				|| die
			dohtml -r "${T}"/docs/*
		popd
	fi
}
