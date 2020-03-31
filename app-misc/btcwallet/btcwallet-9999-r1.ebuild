# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/btcsuite"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_GENERATE=1

inherit systemd golang-live

DESCRIPTION="A secure bitcoin wallet daemon written in Go"
HOMEPAGE="https://btcsuite.github.io"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

DEPEND="net-p2p/btcd"
RDEPEND="${DEPEND}"

DOCS=( CHANGES README.md sample-${PN}.conf )

PDATADIR="\${HOME}/.${PN}"
PCONFDIR="/etc/btcwallet"
PCONFFILE="${PCONFDIR}/btcwallet.conf"

src_install() {
	golang-live_src_install

	# Installs configuration file
	insinto "${PCONFDIR}"
	newins "sample-btcwallet.conf" btcwallet.conf
	fperms 644 "${PCONFFILE}"

	# Install init scripts
	systemd_newuserunit "${FILESDIR}"/${PN}.user.service "${PN}.service"
}

pkg_postinst() {
	elog "Run the following command to create a wallet (replace <RPCUSER>"
	elog "and <RPCPASSWORD> with the desired username and password for"
	elog "authenticating via RPC to the btcd service):"
	elog "   ${PN} -u <RPCUSER> -P <RPCPASSWORD> --create"
	elog "   cp /etc/${PN}/${PN}.conf ${PDATADIR}"
	elog
	elog "Then edit btcwallet configuration file and add the RPC username"
	elog "and password previously specificied:"
	elog "   ${EDITOR} ${PDATADIR}/${PN}.conf"
	elog
	elog "Finally, to enable the btcwallet service when your user log in,"
	elog "execute the following commands as a logged user (non root):"
	elog "   systemctl --user enable ${PN}"
	elog "   systemctl --user start ${PN}"
	elog
	elog "If everything appears to be working, the btcwallet service"
	elog "should be able to successfully connect to the btcd system service."
	elog
	elog "Btcwallet logs can be viewed with:"
	elog "   journalctl --user-unit -f ${PN}"
}
