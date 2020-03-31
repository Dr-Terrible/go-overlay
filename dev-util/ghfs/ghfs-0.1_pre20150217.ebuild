# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/benbjohnson"
GOLANG_PKG_VERSION="3db8676e8d6d421393c8a83e9936b57f350251ce"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bazil/fuse:2345f52 -> bazil.org"
	"github.com/udhos/goauth2:cb9484d494 -> code.google.com/p"
	"github.com/google/go-github:b8b4ac7"
	"github.com/golang/net:c93a9b4 -> golang.org/x"
	"github.com/google/go-querystring:2a60fc2"
)

inherit linux-info golang-single

DESCRIPTION="Ghfs is a user space filesystem that overlays the GitHub API"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

PATCHES=(
	"${FILESDIR}/${PN}-bazil-fuse-api.patch"
)

pkg_setup() {
	local CONFIG_CHECK="~FUSE_FS"
	linux-info_pkg_setup
}
