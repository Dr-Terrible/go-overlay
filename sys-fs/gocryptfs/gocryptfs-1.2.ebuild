# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/rfjakob"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.GitVersion=${PV} -X main.GitVersionFuse=0ad840c"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/hanwen/go-fuse:0ad840c"
	"github.com/jacobsa/crypto:293ce0c"
	"github.com/rfjakob/eme:00acfbb" #v1.0
	"github.com/golang/crypto:a59c127 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Encrypted overlay filesystem written in Go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="ssl"

RDEPEND="sys-fs/fuse
	ssl? ( dev-libs/openssl:0 )"

pkg_setup() {
	GOLANG_PKG_LDFLAGS+=" -X main.BuildTime=$( date +%s )"
}

src_compile() {
	use ssl || GOLANG_PKG_TAGS="without_openssl"
	golang-single_src_compile
}

src_install() {
	golang-single_src_install
	doman "${FILESDIR}"/${PN}.1
}
