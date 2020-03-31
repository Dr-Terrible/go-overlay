# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/jeffail"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_TAGS=""
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/Shopify/sarama:38d579a"
	"github.com/edsrzf/mmap-go:935e0e8"
	"github.com/go-mangos/mangos:7e2b801"
	"github.com/jeffail/gabs:1ad8a46"
	"github.com/jeffail/util:83e0dd9"
	"github.com/streadway/amqp:2e25825"
	"github.com/amir/raidman:c74861f"
	"github.com/davecgh/go-spew:5215b55"
	"github.com/eapache/go-resiliency:b86b1ec"
	"github.com/eapache/queue:ded5959"
	"github.com/golang/snappy:d9eb7a3"
	"github.com/golang/protobuf:98fa357"
	"github.com/golang/net:0455786 -> golang.org/x"
	"github.com/klauspost/crc32:cb6bfca"
	"github.com/pebbe/zmq4:eccbb48"
	"github.com/alexcesaro/statsd:7fea3f0 -> gopkg.in/alexcesaro/statsd.v2"
	"github.com/go-yaml/yaml:a83829b -> gopkg.in/yaml.v2"
)

inherit golang-single

DESCRIPTION="A persistent stream buffer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="zmq doc"

RDEPEND="zmq? ( >=net-libs/zeromq-4.1.1 )"

src_compile() {
	use zmq && GOLANG_PKG_TAGS+=" ZMQ4"
	golang-single_src_compile
}

src_install() {
	golang-single_src_install
	use doc && dodoc -r docs/*
}
