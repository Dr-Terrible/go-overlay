# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/btcsuite"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit user systemd golang-live

DESCRIPTION="An alternative full node bitcoin implementation written in Go"
HOMEPAGE="https://btcsuite.github.io"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

DOCS="CHANGES README.md docs/*"

PUSER="btcd"
PUG="${PUSER}:${PUSER}"
PHOME="/var/lib/${PUSER}"
PCONFDIR="/etc/btcd"
PCONFFILE="${PCONFDIR}/btcd.conf"

pkg_setup() {
	enewgroup "${PUSER}"
	enewuser "${PUSER}" -1 -1 "${PHOME}" "${PUSER}"
}

src_install() {
	golang-live_src_install

	# Installs configuration file
	insinto "${PCONFDIR}"
	newins "${FILESDIR}/btcd.conf" btcd.conf
	fowners "${PUG}" "${PCONFFILE}"
	fperms 600 "${PCONFFILE}"

	# Installs init scripts
	systemd_dounit "${FILESDIR}/btcd.service"
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
	newconfd "${FILESDIR}/${PN}.confd" ${PN}

	# Prepares home directory
	keepdir "${PHOME}"/.btcd
	fperms 700 "${PHOME}"
	fowners "${PUG}" "${PHOME}"
	fowners "${PUG}" "${PHOME}"/.btcd
	dosym "${PCONFFILE}" "${PHOME}"/.btcd/btcd.conf

	# Prepares log directory
	keepdir /var/log/${PN}
	fperms 700 /var/log/${PN}
	fowners ${PN}:${PN} /var/log/${PN}
}
