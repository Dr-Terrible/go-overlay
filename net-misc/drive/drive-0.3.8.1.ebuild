# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/odeke-em"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/boltdb/bolt:583e893" #v1.3.0
	"github.com/cheggaaa/pb:9453b2d" #v1.0.5
	"github.com/mattn/go-isatty:66b8e73"
	"github.com/odeke-em/cache:baf8e43"
	"github.com/odeke-em/cli-spinner:610063b"
	"github.com/odeke-em/command:91ca5ec"
	"github.com/odeke-em/exponential-backoff:96e25d3"
	"github.com/odeke-em/extractor:801861a"
	"github.com/odeke-em/go-utils:d915395"
	"github.com/odeke-em/go-uuid:b211d76"
	"github.com/odeke-em/log:cad53c4"
	"github.com/odeke-em/meddler:d2b51d2"
	"github.com/odeke-em/pretty-words:9d37a7f"
	"github.com/odeke-em/semalim:9c88bf5"
	"github.com/odeke-em/statos:6f7e4db"
	"github.com/skratchdot/open-golang:c874831"
	"github.com/golang/crypto:d172538 -> golang.org/x"
	"github.com/golang/net:f4b625e -> golang.org/x"
	"github.com/golang/oauth2:1e695b1 -> golang.org/x"
	"github.com/GoogleCloudPlatform/google-cloud-go:5af4269"
	"github.com/google/google-api-go-client:3cf64a0"
)

inherit golang-single

DESCRIPTION="Google Drive client for the commandline"

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
		"github.com/GoogleCloudPlatform/google-cloud-go" \
		"cloud.google.com/go"
}

src_install() {
	golang-single_src_install
	mv "${ED}"/usr/bin/${PN} "${ED}"/usr/bin/${PN}-google || die
}
