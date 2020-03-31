# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/DanielKrawisz"
GOLANG_PKG_VERSION="62b55fc4882455b68fa0c00342628c2477390509"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/DanielKrawisz/bmutil:7e76903"
	"github.com/DanielKrawisz/maxrate:fae0eea"
	"github.com/boltdb/bolt:ee716d1" #v1.1.0
	"github.com/btcsuite/btcd:cea5d3c" #v0.12.0
	"github.com/golang/protobuf:545732f"
	"github.com/grpc/grpc-go:4c2aaab"
	"github.com/jessevdk/go-flags:6b9493b"
	"github.com/golang/crypto:c197bcf -> golang.org/x"
	"github.com/golang/net:35b06af -> golang.org/x"

	"github.com/btcsuite/btclog:5005b72"
	"github.com/btcsuite/btcutil:ff82dac" #v0.5.0
	"github.com/btcsuite/fastsha256:302ad4d"
	"github.com/btcsuite/go-socks:cfe8b59"
	"github.com/btcsuite/golangcrypto:53f62d9"
	"github.com/btcsuite/seelog:313961b"

	# Unit Testing
	"github.com/DanielKrawisz/mocknet:c81c9ee"
	"github.com/DanielKrawisz/bmutil:669c809 -> github.com/monetas"
)

inherit user systemd golang-single

DESCRIPTION="bmd is a collection of Bitmessage tools inspired by btcsuite"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

PUSER="bmd"
PHOME="/var/lib/${PUSER}"
PCONFDIR="/etc/bmd"
PCONFFILE="${PCONFDIR}/bmd.conf"

pkg_setup() {
	enewgroup "${PUSER}"
	enewuser "${PUSER}" -1 -1 "${PHOME}" "${PUSER}"
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/grpc/grpc-go" \
		"google.golang.org/grpc"
}

src_install() {
	golang-single_src_install

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
