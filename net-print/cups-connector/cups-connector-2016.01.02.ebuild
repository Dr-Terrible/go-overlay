# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/coreos/go-systemd:master"
	"github.com/codegangsta/cli:master"
	"github.com/golang/oauth2:master -> golang.org/x"
	"github.com/golang/net:master -> golang.org/x"
)

inherit golang-single

SRC_URI+=" https://bazaar.launchpad.net/~chipaca/go-xdg/v0/tarball/10 -> go-xdg.tar.gz"

DESCRIPTION="Google Cloud Print CUPS Connector"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	golang_setup
	mkdir -p "${EGO_SRC}"/launchpad.net || die
	cp -a "${WORKDIR}"/~chipaca/go-xdg "${EGO_SRC}"/launchpad.net || die
	golang-single_src_prepare
}
