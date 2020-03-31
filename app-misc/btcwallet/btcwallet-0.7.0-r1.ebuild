# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/btcsuite"
GOLANG_PKG_VERSION="BTCWALLET_0_7_0_ALPHA"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/btcsuite/bolt:1139dd2"
	"github.com/btcsuite/btcd:cea5d3c" #v0.12.0
	"github.com/btcsuite/btclog:5005b72"
	"github.com/btcsuite/btcrpcclient:e6e3b66"
	"github.com/btcsuite/btcutil:ff82dac" #v0.5.0
	"github.com/btcsuite/fastsha256:302ad4d"
	"github.com/btcsuite/go-flags:6c288d6"
	"github.com/btcsuite/go-socks:cfe8b59"
	"github.com/btcsuite/golangcrypto:53f62d9"
	"github.com/btcsuite/seelog:313961b"
	"github.com/btcsuite/websocket:31079b6"

	# Unit Testing
	"github.com/davecgh/go-spew:5215b55"
)

inherit systemd golang-single

DESCRIPTION="A secure bitcoin wallet daemon written in Go"
HOMEPAGE="https://btcsuite.github.io"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DOCS=( CHANGES README.md sample-${PN}.conf )

PDATADIR="\${HOME}/.${PN}"
PCONFDIR="/etc/btcwallet"
PCONFFILE="${PCONFDIR}/btcwallet.conf"

src_install() {
	golang-single_src_install

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
