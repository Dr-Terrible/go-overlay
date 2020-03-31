# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/influxdata"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.version=${PV} -X main.branch=${PV} -X main.commit=3799237"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_INSTALLSUFFIX="cgo"

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/gogo/protobuf:909568b" # v0.3
	"github.com/golang/crypto:81372b2 -> golang.org/x"
	"github.com/golang/snappy:d9eb7a3"
	"github.com/peterh/liner:8975875"
	"github.com/dgryski/go-bitstream:7d46cd2"
	"github.com/dgryski/go-bits:2ad8d70"
	"github.com/jwilder/encoding:ac74639"
	"github.com/retailnext/hllpp:38a7bb7"
	"github.com/BurntSushi/toml:bbd5bb6" #v0.2.0
	"github.com/bmizerany/pat:c068ca2"
	"github.com/dgrijalva/jwt-go:268038b" #v2.7.0
	"github.com/kimor79/gollectd:b5dddb1" #v1.0.0
	"github.com/rakyll/statik:274df12" #v0.1.0
	"github.com/collectd/go-collectd:9fc824c"
	"github.com/influxdata/usage-client:6d38953"
	"github.com/boltdb/bolt:583e893" #v1.3.0
	"github.com/paulbellamy/ratecounter:5a11f58" #v0.1.0

	# Unit Testing
	"github.com/davecgh/go-spew:6cf5744" #v1.0.0
)

inherit user systemd golang-single

DESCRIPTION="Scalable datastore for metrics, events, and real-time analytics"
HOMEPAGE="http://influxdb.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

pkg_setup() {
	ebegin "Creating ${PN} user and group"
		enewgroup ${PN}
		enewuser ${PN} -1 -1 "/var/lib/${PN}" ${PN}
	eend $?
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/collectd/go-collectd" \
		"collectd.org"

	# FIX: paths in systemd service
	sed -i \
		-e "s:/opt/${PN}/influxd:/usr/bin/influxd:" \
		-e "s:/etc/opt/${PN}:/etc/${PN}:" \
		scripts/${PN}.service \
		|| die

	# FIX: paths in configuration file
	sed -i \
		"s:/var/opt:/var/lib:" \
		etc/config.sample.toml \
		|| die
}

src_install() {
	golang-single_src_install

	# Install configuration files
	insinto /etc/${PN}
	newins etc/config.sample.toml ${PN}.conf

	# Install init scripts
	systemd_dounit "${S}"/scripts/${PN}.service
	systemd_install_serviced "${FILESDIR}"/${PN}.service.conf
	systemd_dotmpfilesd "${FILESDIR}/${PN}.conf"

	keepdir /var/log/${PN}
	fowners -R ${PN}:${PN} /var/log/${PN}
}

src_test() {
	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}

pkg_postinst() {
	elog "The InfluxDB Shell (CLI) is always included within the main package."
	elog "Executing 'influx' will start the CLI and automatically connect to"
	elog "the local InfluxDB instance. The InfluxDB Shell stores that last 1000"
	elog "commands in your home directory in a file called .influx_history."
	elog
	elog "The InfluxDB HTTP API includes a built-in authentication mechanism,"
	elog "based on user credentials, which is disabled by default. To add"
	elog "authentication to InfluxDB set in the [http] section of the"
	elog " config file:"
	elog
	elog "  [http]"
	elog "  ..."
	elog "  auth-enabled = true"
	elog "  ..."
	elog
	elog "By default, InfluxDB sends anonymouse statistics about your InfluxDB"
	elog "instance. If you would like to disable this funcionality, set in"
	elog "the [monitoring] section of your config file:"
	elog
	elog "  [monitoring]"
	elog "  ..."
	elog "  enabled = false"
	elog "  ..."
}
