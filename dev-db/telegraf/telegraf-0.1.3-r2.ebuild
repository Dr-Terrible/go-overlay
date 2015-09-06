# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/influxdb"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.Version ${PV} -X main.Commit 86a6f33"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_GENERATE=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/influxdb/influxdb:8b3219e74f"
	"github.com/naoina/toml:5667c316ee"
	"github.com/naoina/go-stringutil:360db0db4b"
	"github.com/fsouza/go-dockerclient:7b927cb79b"
	"github.com/go-sql-driver/mysql:a197e5d405"
	"github.com/lib/pq:dc50b6ad2d"
	"github.com/gogo/protobuf:6cab0cc9f" # v0.1
	"github.com/hashicorp/raft:4165b47aca"
	"github.com/hashicorp/raft-boltdb:d1e82c1ec3"
	"github.com/hashicorp/go-msgpack:fa3f63826f"
	"github.com/stretchr/objx:cbeaeb16a0"
	"github.com/golang/crypto:1e856cbfdf -> golang.org/x"
	"github.com/golang/protobuf:1dceb1a265"
	"github.com/golang/snappy:723cc1e459"
	"github.com/armon/go-metrics:b2d95e5291"
	"github.com/prometheus/client_golang:e319516b0f"
	"github.com/prometheus/client_model:fa8ad6fec3"
	"github.com/wvanbergen/kafka:e236a65a9c"
	"github.com/wvanbergen/kazoo-go:15e8d60fd2"
	"github.com/Shopify/sarama:16b518acd0 -> gopkg.in/Shopify/sarama.v1" # sarama v1.5.0
	"github.com/dancannon/gorethink:8aca6ba2cc -> gopkg.in/dancannon/gorethink.v1"
	"github.com/eapache/go-resiliency:ed0319b32e"
	"github.com/eapache/queue:ded5959c0d"
	"github.com/matttproud/golang_protobuf_extensions:fc2b8d3a73"
	"github.com/Sirupsen/logrus:5701be89e7" # logrus v0.8.6
	"github.com/cenkalti/backoff:6c45d6bc1e"
	"github.com/samuel/go-zookeeper:5bb5cfc093"

	# NOTE: stable release (v1.0) of boltdb is not supported,
	#       HEAD version is required.
	"github.com/boltdb/bolt:04a3e85793"

	# unit testing
	"github.com/stretchr/testify:232e856367"
)

inherit user systemd golang-single

DESCRIPTION="A plugin-driven server agent for reporting metrics into InfluxDB"
HOMEPAGE="http://influxdb.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"

pkg_setup() {
	ebegin "Creating ${PN} user and group"
		enewgroup ${PN}
		enewuser ${PN} -1 -1 "/var/lib/${PN}" ${PN}
	eend $?
}

src_install() {
	golang-single_src_install

	# Install configuration files
	insinto /etc/${PN}
	newins etc/config.sample.toml ${PN}.conf

	# Install init scripts
	systemd_dounit "${FILESDIR}"/${PN}.service
	systemd_install_serviced "${FILESDIR}"/${PN}.service.conf
	systemd_dotmpfilesd "${FILESDIR}/${PN}.conf"

	keepdir /var/log/${PN}
	fowners -R ${PN}:${PN} /var/log/${PN}
}