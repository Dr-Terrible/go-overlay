# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/hashicorp"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/pborman/uuid:ed3ca8a15a"
	"github.com/Azure/azure-sdk-for-go:99b5c364c7"
	"github.com/Azure/go-pkcs12:a635c0684c"
	"github.com/armon/circbuf:f092b4f207"
	"github.com/aws/aws-sdk-go:ccb4ffd37c -> github.com/awslabs"
	"github.com/cyberdelia/heroku-go:594d483b9b"
	"github.com/hashicorp/atlas-go:d1d08e8e25"
	"github.com/hashicorp/consul:00e35cdc41"
	"github.com/hashicorp/errwrap:7554cd9344"
	"github.com/hashicorp/go-checkpoint:88326f6851"
	"github.com/hashicorp/go-multierror:56912fb08d"
	"github.com/hashicorp/go-version:999359b6b7"
	"github.com/hashicorp/hcl:5486421143"
	"github.com/hashicorp/yamux:8e00b30457"
	"github.com/mitchellh/cli:8102d0ed5e"
	"github.com/mitchellh/colorstring:61164e4994"
	"github.com/mitchellh/copystructure:6fc66267e9"
	"github.com/mitchellh/go-homedir:1f6da4a72e"
	"github.com/mitchellh/mapstructure:281073eb9e"
	"github.com/mitchellh/osext:0dd3f918b2"
	"github.com/mitchellh/panicwrap:45cbfd3bae"
	"github.com/mitchellh/prefixedio:89d9b53599"
	"github.com/mitchellh/reflectwalk:eecf4c70c6"
	"github.com/rackspace/gophercloud:efb1971cbd"
	"github.com/vaughan0/go-ini:a98ad7ee00"
	"github.com/golang/crypto:83f1503f77 -> golang.org/x"

	# Unit Testing
	"github.com/dylanmei/iso8601:2075bf119b"
	"github.com/dylanmei/winrmtest:3e9661c52c"
	"github.com/fsouza/go-dockerclient:5c1d07d4af"
	"github.com/mitchellh/go-linereader:07bab5fdd9"
	"github.com/imdario/mergo:61a5285227"
	"github.com/masterzen/simplexml:95ba30457e"
	"github.com/masterzen/winrm:23128e7b3d"
	"github.com/masterzen/xmlpath:13f4951698"
	"github.com/mitchellh/packer:60bbe850ef"
	"github.com/nu7hatch/gouuid:179d4d0c4d"
	"github.com/packer-community/winrmcp:743b1afe5e"
	"github.com/pearkes/cloudflare:19e280b056"
	"github.com/pearkes/digitalocean:e966f00c2d"
	"github.com/pearkes/dnsimple:2a807d118c"
	"github.com/pearkes/mailgun:5b02e7e9ff"
	"github.com/satori/go.uuid:6b8e5b55d2"
	"github.com/soniah/dnsmadeeasy:5578a8c15e"
	"github.com/xanzy/go-cloudstack:00319560ee"
	"github.com/golang/net:4a71d18255 -> golang.org/x"
	"github.com/golang/oauth2:8914e5017c -> golang.org/x"
	"github.com/google/google-api-go-client:0a735f7ec8"
	"github.com/GoogleCloudPlatform/gcloud-golang:e34a32f9b0"
)

inherit golang-single

DESCRIPTION="Terraform is a tool for building, changing, and combining infrastructure safely and efficiently"
HOMEPAGE="http://www.terraform.io"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/pborman/uuid" \
		"code.google.com/p/go-uuid"

	golang_fix_importpath_alias \
		"github.com/google/google-api-go-client" \
		"google.golang.org/api"

	golang_fix_importpath_alias \
		"github.com/GoogleCloudPlatform/gcloud-golang" \
		"google.golang.org/cloud"
}