# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/btcsuite"
GOLANG_PKG_VERSION="BTCD_0_12_0_BETA"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/btcsuite/btclog:5005b72"
	"github.com/btcsuite/btcutil:ff82dac" #v0.5.0
	"github.com/btcsuite/fastsha256:302ad4d"
	"github.com/btcsuite/go-flags:6c288d6"
	"github.com/btcsuite/go-socks:cfe8b59"
	"github.com/btcsuite/golangcrypto:53f62d9"
	"github.com/btcsuite/goleveldb:1fde62c"
	"github.com/btcsuite/seelog:313961b"
	"github.com/btcsuite/snappy-go:0bdef8d"
	"github.com/btcsuite/websocket:31079b6"

	# Unit Testing
	"github.com/davecgh/go-spew:5215b55"
)

inherit user systemd golang-single

DESCRIPTION="An alternative full node bitcoin implementation written in Go"
HOMEPAGE="https://btcsuite.github.io"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86 arm"

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
	golang-single_src_install

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
