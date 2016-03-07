# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mitchellh"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/protobuf:1270911"
	"github.com/golang/text:07b9a78 -> golang.org/x"
	"github.com/golang/net:b6d7b13 -> golang.org/x"
	"github.com/go-yaml/yaml:f7716cb -> gopkg.in/yaml.v2"
	"github.com/grpc/grpc-go:178b68e"
	"github.com/golang/oauth2:188fb45 -> golang.org/x"
	"github.com/go-fsnotify/fsnotify:8611c35 -> gopkg.in/fsnotify.v1" # v1.2.9
	"github.com/go-tomb/tomb:dd63297 -> gopkg.in/tomb.v1"
	"github.com/GoogleCloudPlatform/gcloud-golang:872c736"
	"github.com/hpcloud/tail:1a0242e"
)

inherit golang-single

DESCRIPTION="Packer is a tool for creating identical machine images for multiple platforms"
HOMEPAGE="http://www.packer.io"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DOCS=( CHANGELOG.md CONTRIBUTING.md README.md )

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/grpc/grpc-go" \
		"google.golang.org/grpc"

	golang_fix_importpath_alias \
		"github.com/GoogleCloudPlatform/gcloud-golang" \
		"google.golang.org/cloud"

	golang_fix_importpath_alias \
		"github.com/hpcloud/tail" \
		"github.com/ActiveState/tail"

	rm -r vendor/google.golang.org/cloud || die
	rm -r vendor/github.com/hpcloud/tail || die
	rm -r vendor/gopkg.in/tomb.v1 || die
	rm -r vendor/github.com/golang/protobuf || die
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
