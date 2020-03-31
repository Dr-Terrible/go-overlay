# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/joohoi"
GOLANG_PKG_TAGS=""
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

inherit user golang-single

DESCRIPTION="Limited DNS server with RESTful HTTP API to handle ACME DNS challenges"
HOMEPAGE="https://github.com/joohoi/acme-dns"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="postgres +sqlite"

DEPEND="
	postgres? ( dev-db/postgresql:* )
	sqlite? ( dev-db/sqlite:3 )
"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_compile() {
	use sqlite && GOLANG_PKG_TAGS+=" sqlite3"
	use postgres && GOLANG_PKG_TAGS+=" postgres"

	golang-single_src_compile
}

src_install() {
	golang-single_src_install

	newinitd "${FILESDIR}"/${PN}.init acme-dns || die "installing init failed"
	newconfd "${FILESDIR}"/${PN}.conf acme-dns || die "installing conf failed"

	diropts -m0750 -o ${PN} -g ${PN}
	dodir /var/lib/${PN}
	dodir /var/log/${PN}

	insopts -m0644
	insinto /etc/${PN}
	newins config.cfg config.cfg || die "installing config.cfg failed"
}

pkg_postinst() {
	elog "By default, the acme-dns daemon serves domain name queries on the"
	elog "priviledged port 53 and therefore has to be running as root. To"
	elog "tighten your security, you should do either or both of the following:"
	elog
	elog "Configure the firewall to accept domain name queries only from your"
	elog "authorized forwarding DNS only."
	elog
	elog "Run the acme-dns daemon as user acme-dns:acme-dns on an unpriviledged"
	elog "port and then configure the firewall to forward all domain name queries"
	elog "to this unpriviledged port."
}
