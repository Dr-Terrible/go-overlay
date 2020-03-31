# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/influxdata"
GOLANG_PKG_LDFLAGS="-X main.version=${PV} -X main.branch=${PV} -X main.commit=59ab793"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_GENERATE=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/influxdata/influxdb:3799237" # v1.0.0
	"github.com/influxdata/config:8ec4638"
	"github.com/influxdata/toml:ad49a5c"
	"github.com/gobwas/glob:ce6abff" #0.2.0
	"github.com/naoina/go-stringutil:6b638e9" #0.1.0
	"github.com/amir/raidman:c74861f"
	"github.com/aws/aws-sdk-go:ddfd17e" #v1.4.10
	"github.com/couchbase/go-couchbase:6ab3c78"
	"github.com/davecgh/go-spew:6cf5744" #v1.0.0
	"github.com/docker/engine-api:611c63f"
	"github.com/docker/distribution:12acdf0" #v2.5.1
	"github.com/docker/go-connections:990a1a1" #v0.2.1
	"github.com/docker/go-units:f2d77a6" #v0.3.1
	"github.com/couchbase/gomemcached:6172a8c"
	"github.com/couchbase/goutils:5823a0c"
	"github.com/go-sql-driver/mysql:a732e14" #v1.2
	"github.com/gonuts/go-shellquote:e842a11"
	"github.com/gorilla/mux:0eeaf83" #v1.1
	"github.com/gorilla/context:1ea2538" #v1.1
	"github.com/hpcloud/tail:a30252c" #v1.0.0:w
	"github.com/lib/pq:50761b0"
	"github.com/hashicorp/consul:a189091" #v0.7.0
	"github.com/golang/crypto:81372b2 -> golang.org/x"
	"github.com/golang/net:71a0359 -> golang.org/x"
	"github.com/golang/protobuf:552c7b9"
	"github.com/golang/snappy:d9eb7a3"
	"github.com/golang/text:04b8648 -> golang.org/x"
	"github.com/prometheus/client_golang:c5b7fcc" #v0.8.0
	"github.com/prometheus/client_model:fa8ad6f"
	"github.com/prometheus/common:76316ea"
	"github.com/prometheus/procfs:abf152e"
	"github.com/shirou/gopsutil:22a03b5" #v2.1
	"github.com/soniah/gosnmp:eb32571"
	"github.com/aerospike/aerospike-client-go:7f3a312" #v1.18.0
	"github.com/sparrc/aerospike-client-go:d4bb42d"
	"github.com/streadway/amqp:2e25825"
	"github.com/beorn7/perks:4c0e845"
	"github.com/vjeantet/grok:83bfdfd"
	"github.com/wvanbergen/kafka:46f9a1c"
	"github.com/wvanbergen/kazoo-go:0f76871"
	"github.com/yuin/gopher-lua:6a1397d"
	"github.com/zensqlmonitor/go-mssqldb:ffe5510"
	"github.com/Shopify/sarama:bd61cae" # v1.10.1
	"github.com/klauspost/crc32:19b0b33" #v1.0
	"github.com/kardianos/service:7a88211"
	"github.com/kardianos/osext:c2c54e5"
	"github.com/mreiferson/go-snappystream:028eae7" #v0.2.3
	"github.com/dancannon/gorethink:edc7a6a -> gopkg.in/dancannon/gorethink.v1" #v1.4.1
	"github.com/go-mgo/mgo:3f83fa5 -> gopkg.in/mgo.v2"
	"github.com/go-yaml/yaml:31c2992 -> gopkg.in/yaml.v2"
	"github.com/fatih/pool:20a0a42 -> gopkg.in/fatih/pool.v2"
	"github.com/eapache/go-resiliency:6800482" #v1.0.0
	"github.com/eapache/go-xerial-snappy:bb955e0"
	"github.com/eapache/queue:ded5959" #v1.0.2
	"github.com/matttproud/golang_protobuf_extensions:3247c84" #v1.0.0
	"github.com/Sirupsen/logrus:4b6ea73" # logrus v0.10.0
	"github.com/eclipse/paho.mqtt.golang:45f9b18"
	"github.com/cenkalti/backoff:32cd0c5" #v1.0.0
	"github.com/hailocab/go-hostpool:e80d13c"
	"github.com/samuel/go-zookeeper:87e1bca"
	"github.com/miekg/dns:db96a2b"
	"github.com/nats-io/go-nats:fc85f44" #v1.2.0
	"github.com/nats-io/nuid:a5152d6"
	"github.com/nsqio/go-nsq:d71fb89" #v1.0.6
	"github.com/opencontainers/runc:04f275d" #v1.0.0-rc1
	"github.com/boltdb/bolt:583e893" #v1.3.0

	# unit testing
	"github.com/stretchr/testify:f390dcf" #1.1.3
)

inherit user systemd golang-single

DESCRIPTION="A plugin-driven server agent for reporting metrics into InfluxDB"
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
		"github.com/nats-io/go-nats" \
		"github.com/nats-io/nats"
}

src_install() {
	golang-single_src_install

	# Install configuration files
	insinto /etc/${PN}
	doins etc/${PN}.conf

	# Install init scripts
	systemd_dounit "${FILESDIR}"/${PN}.service
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
