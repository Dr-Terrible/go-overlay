# Copyright 1999-2015 Gentoo Foundation
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
	"github.com/agl/ed25519:278e1ec8e8a6e017cd07577924d6766039146ced"
	"github.com/bigeagle/water:36aebfeb35da4f1f6a975726716c6fc563c5c495"
	"github.com/dchest/blake2b:3c8c640cd7bea3ca78209d812b5854442ab92fed"
	"github.com/magical/argon2:82d59eb7dab9a6268371a8c6de2100a2c7357bc6"
	"github.com/golang/crypto:81bf7719a6b7ce9b665598222362b50122dfc13b -> golang.org/x"
)

inherit systemd golang-single

DESCRIPTION="Simple secure free software VPN daemon"
HOMEPAGE="http://www.cypherpunks.ru/govpn/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

GOLANG_PKG_VENDOR=(
	"${S}"
)

src_prepare() {
	golang-single_src_prepare

	sed -i \
			-e "s@\$(dirname \$0)/storekey.sh@\$(dirname \$0)/${PN}-storekey.sh@" \
			"${S}"/utils/newclient.sh \
			|| die
}

src_install() {
	golang-single_src_install

	newbin "${S}"/utils/newclient.sh ${PN}-newclient.sh
	newbin "${S}"/utils/storekey.sh ${PN}-storekey.sh
}
