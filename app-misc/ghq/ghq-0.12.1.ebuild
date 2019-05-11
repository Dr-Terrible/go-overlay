# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/motemen"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:2ee8785" # v3.5.1
	"github.com/daviddengcn/go-colortext:186a3d4"
	"github.com/golangplus/bytes:45c989f"
	"github.com/golangplus/fmt:2a5d6d7"
	"github.com/golangplus/testing:af21d9c"
	"github.com/motemen/go-colorine:45d1916"
	"github.com/urfave/cli:cfb3883"
	"github.com/golang/net:f4e77d3 -> golang.org/x"
	"github.com/golang/sync:1122301 -> golang.org/x"
	"github.com/golang/xerrors:3850056 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Remote repository management made easy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="dev-vcs/git"

src_install() {
	golang-single_src_install

	dodoc ghq.txt
}
