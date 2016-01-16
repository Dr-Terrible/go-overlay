# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/mitchellh"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/aws/aws-sdk-go:f096b7d" # v0.9.5
	"github.com/digitalocean/godo:2a0d64a" # v0.9.0
	"github.com/dylanmei/iso8601:2075bf1"
	"github.com/dylanmei/winrmtest:0256178"
	"github.com/going/toolkit:5bff591"
	"github.com/golang/crypto:3760e01 -> golang.org/x"
	"github.com/golang/net:c93a9b4 -> golang.org/x"
	"github.com/golang/oauth2:2baa8a1 -> golang.org/x"
	"github.com/google/google-api-go-client:a5c3e2a"
	"github.com/google/go-querystring:2a60fc2"
	"github.com/go-fsnotify/fsnotify:508915b -> gopkg.in/fsnotify.v1" # v1.2.8
	"github.com/go-tomb/tomb:dd63297 -> gopkg.in/tomb.v1"
	"github.com/go-xmlpath/xmlpath:a146725"
	"github.com/GoogleCloudPlatform/gcloud-golang:6fdcab4"
	"github.com/grpc/grpc-go:7890599"
	"github.com/jmespath/go-jmespath:3433f3e" # 0.2.2
	"github.com/hashicorp/atlas-go:b66e377"
	"github.com/hashicorp/errwrap:7554cd9"
	"github.com/hashicorp/go-checkpoint:e4b2dc3"
	"github.com/hashicorp/go-cleanhttp:ce617e7"
	"github.com/hashicorp/go-msgpack:fa3f638"
	"github.com/hashicorp/go-multierror:d30f099"
	"github.com/hashicorp/go-version:2b9865f"
	"github.com/hashicorp/yamux:df94978"
	"github.com/hpcloud/tail:272d489"
	"github.com/kardianos/osext:29ae4ff"
	"github.com/klauspost/compress:2dd54ae"
	"github.com/klauspost/cpuid:ef30b90"
	"github.com/klauspost/crc32:a3b15ae"
	"github.com/klauspost/pgzip:47f36e1"
	"github.com/masterzen/simplexml:95ba304"
	"github.com/masterzen/winrm:54ea5d0"
	"github.com/masterzen/xmlpath:13f4951698"
	"github.com/mitchellh/cli:8102d0e"
	"github.com/mitchellh/go-fs:a34c1b9"
	"github.com/mitchellh/go-vnc:723ed98"
	"github.com/mitchellh/iochan:87b45ff"
	"github.com/mitchellh/mapstructure:281073e"
	"github.com/mitchellh/multistep:162146f"
	"github.com/mitchellh/panicwrap:a1e50bc"
	"github.com/mitchellh/prefixedio:6e69540"
	"github.com/mitchellh/reflectwalk:eecf4c70c6"
	"github.com/nu7hatch/gouuid:179d4d0"
	"github.com/packer-community/winrmcp:3d184ce"
	"github.com/pierrec/lz4:222ab1f"
	"github.com/pierrec/xxHash:122b94d"
	"github.com/rackspace/gophercloud:761cff8"
	"github.com/satori/go.uuid:d41af8b"
	"github.com/tent/http-link-go:ac974c6"
	"github.com/vaughan0/go-ini:a98ad7e"
)

inherit golang-single

DESCRIPTION="Packer is a tool for creating identical machine images for multiple platforms"
HOMEPAGE="http://www.packer.io"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"

# go-tools is required by "go:generate stringer" directive
DEPEND="dev-util/go-tools"

DOCS=( CHANGELOG.md CONTRIBUTING.md README.md )

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/google/google-api-go-client" \
		"google.golang.org/api"

	golang_fix_importpath_alias \
		"github.com/GoogleCloudPlatform/gcloud-golang" \
		"google.golang.org/cloud"

	golang_fix_importpath_alias \
		"github.com/hpcloud/tail" \
		"github.com/ActiveState/tail"

	# FIX: github.com/mitchellh/osext has been deprecated
	#      in favour of github.com/kardianos/osext
	sed -i \
		-e "s:github.com\/mitchellh\/osext:github.com\/kardianos\/osext:" \
		"${GOPATH}"/src/github.com/mitchellh/panicwrap/panicwrap.go \
		config.go \
		|| die

	# disable broken test
	sed -i \
		-e "s:TestProvision_Cancel(:_\0:" \
		-e "s:TestProvision_waitForCommunicatorWithCancel(:_\0:" \
		provisioner/windows-restart/provisioner_test.go \
		|| die
}

src_install() {
	golang-single_src_install

	# prefixing all the binaries
	for pkg in "${ED}"/usr/bin/*; do
		[[ "${PN}" == ${pkg##*/} ]] && continue
		mv "${pkg}" "${ED}"/usr/bin/${PN}-${pkg##*/} || die
	done

	# install zsh-completion
	insinto /usr/share/zsh/site-functions
	doins contrib/zsh-completion/_packer
}
