# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/odeke-em"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
#GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/boltdb/bolt:ee716d1" #v1.1.0
	"github.com/cheggaaa/pb:a9a708f"
	"github.com/mattn/go-isatty:ae0b1f8"
	"github.com/odeke-em/cache:baf8e43"
	"github.com/odeke-em/cli-spinner:610063b"
	"github.com/odeke-em/command:91ca5ec"
	"github.com/odeke-em/exponential-backoff:96e25d3"
	"github.com/odeke-em/extractor:801861a"
	"github.com/odeke-em/go-utils:f9f5791"
	"github.com/odeke-em/log:cad53c4"
	"github.com/odeke-em/meddler:d2b51d2"
	"github.com/odeke-em/pretty-words:9d37a7f"
	"github.com/odeke-em/statos:f27d6ab"
	"github.com/skratchdot/open-golang:c874831"
	"github.com/golang/net:2cba614 -> golang.org/x"
	"github.com/golang/oauth2:8914e5017c -> golang.org/x"
	"github.com/GoogleCloudPlatform/gcloud-golang:137f428"
	"github.com/google/google-api-go-client:dc6d235"
)

inherit golang-single

DESCRIPTION="Google Drive client for the commandline"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RESTRICT+=" test"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/google/google-api-go-client" \
		"google.golang.org/api"

	golang_fix_importpath_alias \
		"github.com/GoogleCloudPlatform/gcloud-golang" \
		"google.golang.org/cloud"
}

src_install() {
	golang-single_src_install
	mv "${ED}"/usr/bin/${PN} "${ED}"/usr/bin/${PN}-google || die
}