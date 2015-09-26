# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_IMPORTPATH_ALIAS="golang.org/x"
GOLANG_PKG_NAME="${PN/go-}"
GOLANG_PKG_VERSION="6b41c776c8733a36ba4586aa0bfaf5b6878c41d8"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:669b27b881 -> golang.org/x"
	"github.com/golang/protobuf:1dceb1a265"
	"github.com/golang/appengine:d2b1961e34"
	"github.com/GoogleCloudPlatform/gcloud-golang:e34a32f9b0"
)

inherit golang-single

DESCRIPTION="Various packages and tools that support the Go programming language"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="!dev-go/go-tools
	!<dev-lang/go-1.5"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/golang/appengine" \
		"google.golang.org/appengine"

	golang_fix_importpath_alias \
		"github.com/GoogleCloudPlatform/gcloud-golang" \
		"google.golang.org/cloud"
}