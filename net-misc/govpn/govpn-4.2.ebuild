# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/stargrave"
GOLANG_PKG_BUILDPATH="/src/${PN}/cmd/..."
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_LDFLAGS="-X govpn.Version=${PV}"

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/agl/ed25519:278e1ec"
	"github.com/songgao/water:e7338c3 -> github.com/bigeagle"
	"github.com/dchest/blake2b:3c8c640"
	"github.com/magical/argon2:82d59eb"
	"github.com/golang/crypto:f18420e -> golang.org/x"
)

inherit systemd golang-single

DESCRIPTION="Simple secure free software VPN daemon"
HOMEPAGE="http://www.cypherpunks.ru/govpn"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE+=" doc"

DEPEND=">=dev-lang/go-1.5.1
doc? (
	sys-apps/texinfo
	media-gfx/plantuml
)"

GOLANG_PKG_VENDOR=(
	"${S}"
)

src_prepare() {
	golang-single_src_prepare

	sed -i \
			-e "s:/storekey.sh:/${PN}-storekey.sh:" \
			utils/newclient.sh \
			|| die
}

src_install() {
	golang-single_src_install

	# install documentation
	if use doc; then
		einfo "Bulding documentation ..."
		emake -C doc/
		dohtml -r doc/${PN}.html/*
	fi

	# install utils
	newbin "${S}"/utils/newclient.sh ${PN}-newclient.sh
	newbin "${S}"/utils/storekey.sh ${PN}-storekey.sh
}
