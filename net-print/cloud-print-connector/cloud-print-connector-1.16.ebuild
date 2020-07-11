# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_VERSION="cee4c3eeaf35244729708cde65afca44c034a943"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mildred/go-xdg:96b70c9"
	"github.com/google/uuid:0cd6bf5"         #v1.1.1
	"github.com/coreos/go-systemd:61c7ee6"   # v13
	"github.com/urfave/cli:d648edd"          #v2.2.0
	"github.com/cpuguy83/go-md2man:f79a8a8"  #v2.0.0
	"github.com/golang/oauth2:bf48bf1 -> golang.org/x"
	"github.com/golang/net:ab34263 -> golang.org/x"
)

inherit golang-single systemd

DESCRIPTION="Google Cloud Print CUPS Connector"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 arm arm64 x86"
IUSE="systemd"

RDEPEND="systemd? ( sys-apps/systemd:0= )
	net-analyzer/net-snmp
	net-print/cups
	net-dns/avahi
	acct-user/${PN}
	acct-group/${PN}
	!net-print/cups-connector
"

PATCHES=(
	"${FILESDIR}"/cups-2.3.patch
	"${FILESDIR}"/cups-FTBFS-2.3.patch
	"${FILESDIR}"/systemd.patch
)

pkg_setup() {
	GOLANG_PKG_LDFLAGS+=" -X github.com/google/cloud-print-connector/lib.BuildDate=v${PV}"
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
	systemd_dounit systemd/${PN}.service
	systemd_reenable ${PN}.service

	keepdir /etc/cloud-print-connector
}

pkg_postinst() {
	elog "Configuration file is locate at /etc/cloud-print-connector/gcp-cups-connector.config.json"
	elog
	elog "You must be in the 'gcp' group to use Google Cups Connector."
	elog "Just run (replace <USER> with the desired username):"
	elog "    gpasswd -a <USER> gcp"
	elog
	elog "then have <USER> re-login."
}
