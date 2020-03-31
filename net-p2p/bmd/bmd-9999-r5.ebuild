# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/DanielKrawisz"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

inherit user systemd golang-live

DESCRIPTION="bmd is a collection of Bitmessage tools inspired by btcsuite"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

PUSER="bmd"
PHOME="/var/lib/${PUSER}"
PCONFDIR="/etc/bmd"
PCONFFILE="${PCONFDIR}/bmd.conf"

pkg_setup() {
	enewgroup "${PUSER}"
	enewuser "${PUSER}" -1 -1 "${PHOME}" "${PUSER}"
}

src_unpack() {
	golang-live_src_unpack

	if use test; then
		golang-live_src_fetch github.com/DanielKrawisz/mocknet
		golang-live_src_fetch github.com/DanielKrawisz/bmutil
	fi
}

src_prepare() {
	golang-live_src_prepare

	golang_fix_importpath_alias \
		"github.com/DanielKrawisz/bmutil" \
		"github.com/monetas/bmutil"
}

src_install() {
	golang-live_src_install

	# Installs configuration file
	insinto "${PCONFDIR}"
	newins "${S}/sample-bmd.conf" bmd.conf
	fowners "${PUSER}:${PUSER}" "${PCONFFILE}"
	fperms 600 "${PCONFFILE}"

	# Installs init scripts
	systemd_dounit "${FILESDIR}/bmd.service"
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
	newconfd "${FILESDIR}/${PN}.confd" ${PN}

	# Prepares home directory
	keepdir "${PHOME}"/.bmd
	fperms 700 "${PHOME}"
	fowners "${PUSER}:${PUSER}" "${PHOME}"
	fowners "${PUSER}:${PUSER}" "${PHOME}"/.bmd
	dosym "${PCONFFILE}" "${PHOME}"/.bmd/bmd.conf

	# Prepares log directory
	keepdir /var/log/${PN}
	fperms 700 /var/log/${PN}
	fowners ${PN}:${PN} /var/log/${PN}
}
