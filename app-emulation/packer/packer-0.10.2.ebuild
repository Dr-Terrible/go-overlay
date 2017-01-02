# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/mitchellh"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/protobuf:b982704"
	"github.com/golang/net:6ccd669 -> golang.org/x"
	"github.com/golang/oauth2:1e695b1 -> golang.org/x"
	"github.com/go-fsnotify/fsnotify:8611c35 -> gopkg.in/fsnotify.v1" # v1.2.9
	"github.com/go-tomb/tomb:dd63297 -> gopkg.in/tomb.v1"
	"github.com/GoogleCloudPlatform/google-cloud-go:5af4269"
	"github.com/golang/appengine:6bde959"
	"github.com/grpc/grpc-go:b1a2821" #v1.0.2
	"github.com/hpcloud/tail:1a0242e"
	"github.com/rackspace/gophercloud:53d1dc4"
	"github.com/mitchellh/mapstructure:281073e"
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
		"github.com/GoogleCloudPlatform/google-cloud-go" \
		"cloud.google.com/go"

	golang_fix_importpath_alias \
		"github.com/golang/appengine" \
		"google.golang.org/appengine"

	rm -r vendor/google.golang.org/cloud || die
	rm -r vendor/google.golang.org/appengine || die
	rm -r vendor/golang.org/x/net || die
	rm -r vendor/golang.org/x/oauth2 || die
	rm -r vendor/github.com/rackspace/gophercloud || die
	rm -r vendor/github.com/hpcloud/tail || die
	rm -r vendor/github.com/golang/protobuf || die
	rm -r vendor/gopkg.in/tomb.v1 || die
	rm -r vendor/gopkg.in/fsnotify.v1 || die
	rm -r vendor/github.com/mitchellh/mapstructure || die
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
