# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ALIAS="cypherpunks.ru"

GOLANG_PKG_IMPORTPATH="github.com/stargrave"
GOLANG_PKG_BUILDPATH="/cmd/${PN}-client /cmd/${PN}-server /cmd/${PN}-verifier"
GOLANG_PKG_LDFLAGS="-X cypherpunks.ru/govpn.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/agl/ed25519:278e1ec"
	"github.com/bigeagle/water:36aebfe"
	"github.com/dchest/blake2b:3c8c640"
	"github.com/golang/crypto:0e31b18 -> golang.org/x"
	"github.com/go-yaml/yaml:e4d366f -> gopkg.in/yaml.v2"
	"github.com/stargrave/balloon:9e7f630 -> ${ALIAS}"
)

inherit systemd golang-single

DESCRIPTION="Simple secure free software VPN daemon"
HOMEPAGE="http://www.govpn.info"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE+=" doc"

DEPEND="doc? (
	sys-apps/texinfo
	media-gfx/plantuml
)"

src_prepare() {
	golang-single_src_prepare

	# Move cybersphere.ru/ inside the GOPATH,
	# and export it as an importpath alias
	mkdir -p "${ALIAS}" || die
	mv "${S}"/src/${ALIAS}/${PN} ${GOPATH}/src/${ALIAS}/ || die
	export GOLANG_PKG_IMPORTPATH_ALIAS="$ALIAS"
}

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
