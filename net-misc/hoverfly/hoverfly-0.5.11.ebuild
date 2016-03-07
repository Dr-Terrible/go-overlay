# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/SpectoLabs"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/Sirupsen/logrus:be52937" # v0.9.0
	"github.com/elazarl/goproxy:bee2110"
	"github.com/meatballhat/negroni-logrus:0456e76"
	"github.com/codegangsta/negroni:c7477ad"
	"github.com/go-zoo/bone:7e65666" # v1.1
	"github.com/boltdb/bolt:ee716d1" # v1.1.0
	"github.com/rakyll/statik:274df12"
	"github.com/rcrowley/go-metrics:51425a2"
	"github.com/gorilla/websocket:4935ba3"
)

inherit golang-single

DESCRIPTION="Hoverfly is a lightweight, open source service virtualization tool."
HOMEPAGE="http://hoverfly.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND=">=dev-lang/go-1.5.3"

src_prepare() {
	golang-single_src_prepare

	rm -r "${S}"/vendor || die
}
