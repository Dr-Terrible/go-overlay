# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/rfjakob"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.GitVersion=${PV} -X main.GitVersionFuse=161a164"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/hanwen/go-fuse:161a164844568ebf4bfaa68c90ba3a9f2914dda4"
	"github.com/jacobsa/crypto:9f44e2d11115452dad8f404f029574422855f46a"
	"github.com/pkg/xattr:7782c2d6871d6e659e1563dc19c86b845264a6fc"
	"github.com/rfjakob/eme:2222dbd4ba467ab3fc7e8af41562fcfe69c0d770"
	"github.com/sabhiram/go-gitignore:d3107576ba9425fc1c85f4b3569c4631b805a02e"
	"github.com/golang/crypto:a1f597ede03a7bef967a422b5b3a5bd08805a01e -> golang.org/x"
	"github.com/golang/sync:e225da77a7e68af35c70ccbf71af2b83e6acac3c -> golang.org/x"
	"github.com/golang/sys:61b9204099cb1bebc803c9ffb9b2d3acd9d457d9 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Encrypted overlay filesystem written in Go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
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
