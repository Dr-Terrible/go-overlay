# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

MY_PN="/src/cypherpunks.ru/${PN}/cmd/${PN}"

GOLANG_PKG_IMPORTPATH="github.com/stargrave"
GOLANG_PKG_BUILDPATH="${MY_PN}-client ${MY_PN}-server ${MY_PN}-verifier"
GOLANG_PKG_LDFLAGS="-X cypherpunks.ru/govpn.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/agl/ed25519:278e1ec"
	"github.com/songgao/water:dd043ef -> github.com/bigeagle"
	"github.com/dchest/blake2b:3c8c640"
	"github.com/magical/argon2:82d59eb"
	"github.com/golang/crypto:1f22c01 -> golang.org/x"
	"github.com/go-yaml/yaml:f7716cb -> gopkg.in/yaml.v2"
)

inherit systemd golang-single

DESCRIPTION="Simple secure free software VPN daemon"
HOMEPAGE="http://www.cypherpunks.ru/govpn"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE+=" doc"

GOLANG_PKG_VENDOR=( "${S}" )

#DEPEND=">=dev-lang/go-1.5.1
DEPEND="
	doc? (
		sys-apps/texinfo
		media-gfx/plantuml
	)"

src_install() {
	golang-single_src_install

	# install documentation
	if use doc; then
		einfo "Bulding documentation ..."
		emake -C doc/
		docinto html
		dodoc -r doc/${PN}.html/*
	fi

	# install utils
	newbin "${S}"/utils/newclient.sh ${PN}-newclient.sh
}
