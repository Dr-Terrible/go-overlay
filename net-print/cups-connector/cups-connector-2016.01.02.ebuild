# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_LDFLAGS="-X github.com/google/cups-connector/lib.BuildDate=${PV}"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mildred/go-xdg:96b70c9"
	"github.com/coreos/go-systemd:b4a58d9" # v4
	"github.com/codegangsta/cli:5db7419"
	"github.com/golang/oauth2:188fb45 -> golang.org/x"
	"github.com/golang/net:b6d7b13 -> golang.org/x"
)

inherit user golang-single systemd

#SRC_URI+=" https://bazaar.launchpad.net/~chipaca/go-xdg/v0/tarball/10 -> go-xdg.tar.gz"

DESCRIPTION="Google Cloud Print CUPS Connector"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

CDEPEND="net-analyzer/net-snmp"
RDEPEND="${CDEPEND}
	net-print/cups
	net-dns/avahi"

GCP_HOME="/var/lib/${PN}"

pkg_setup() {
	enewuser ${PN} -1 -1 "${GCP_HOME}"
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/mildred/go-xdg" \
		"launchpad.net/go-xdg/v0"
}

src_install() {
	golang-single_src_install

	# install systemd services
	systemd_dounit "${FILESDIR}"/gcp.service

	diropts "-m0700 -o${PN}"
	dodir "${GCP_HOME}"
	keepdir /etc/gcp_cups_connector
}

pkg_postinst() {
	elog
	elog "You must be in the 'gcp' group to use Google Cups Connector."
	elog "Just run (replace <USER> with the desired username):"
	elog "    gpasswd -a <USER> gcp"
	elog
	elog "then have <USER> re-login."
}
