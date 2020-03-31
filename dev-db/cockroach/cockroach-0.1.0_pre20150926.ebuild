# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/cockroachdb"
GOLANG_PKG_VERSION="a6d763f3e97156e008257c861606bb0606ccc23e"
GOLANG_PKG_TAGS="netgo release"
GOLANG_PKG_INSTALLSUFFIX="netgo"
GOLANG_PKG_LDFLAGS="-extldflags=-static"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/biogo/store:3b4c041f52"
	"github.com/cockroachdb/c-lz4:6e71f140a3"
	"github.com/cockroachdb/c-snappy:618733f9e5"
	"github.com/cockroachdb/c-protobuf:6a18bfcdd5"
	"github.com/cockroachdb/c-rocksdb:7fc876fe79"
	"github.com/coreos/etcd:e4561dd8cf" #v2.2.0
	"github.com/elazarl/go-bindata-assetfs:d5cac42555"
	"github.com/gogo/protobuf:2093b57e5c" # HEAD (dont' use v0.1)
	"github.com/google/btree:cc6329d427"
	"github.com/julienschmidt/httprouter:6aacfd5ab5"
	"github.com/montanaflynn/stats:4f7f6ef388" # v0.1.0
	"github.com/olekukonko/tablewriter:b9346ac189"
	"github.com/peterh/liner:1bb0d1c1a2"
	"github.com/spf13/cobra:c55cdf3385"
	"github.com/golang/crypto:1e856cbfdf -> golang.org/x"
	"github.com/golang/net:669b27b881 -> golang.org/x"
	"github.com/golang/text:d611288f0d -> golang.org/x"
	"github.com/go-yaml/yaml:9f9df34309 -> gopkg.in/yaml.v1"
	"github.com/samalba/dockerclient:cfb489c624"
	"github.com/lib/pq:dc50b6ad2d"
	"github.com/inconshreveable/mousetrap:76626ae9c9"
	"github.com/spf13/pflag:4869ec2ae0"
	"github.com/docker/docker:0a8c2e3717" # v1.8.2
)

inherit golang-single

DESCRIPTION="A scalable, geo-replicanted, transactional datastore"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

# <go1.4 is not supported
# see github.com/cockcroach/issues/3278
DEPEND=">=dev-lang/go-1.5.1"
