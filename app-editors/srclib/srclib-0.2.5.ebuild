# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/sourcegraph"
GOLANG_PKG_IMPORTPATH_ALIAS="sourcegraph.com/sourcegraph"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/alecthomas/binary:21c37b5"
	"github.com/alecthomas/unsafeslice:a2ace32"
	"github.com/alexsaveliev/go-colorable-wrapper:32a2486"
	"github.com/fsouza/go-dockerclient:4ebe9fc"
	"github.com/gogo/protobuf:2008751"
	"github.com/golang/protobuf:3d2510a"
	"github.com/kardianos/osext:6e7f843"
	"github.com/kr/binarydist:9955b0a"
	"github.com/kr/fs:2788f0d"
	"github.com/mattn/go-colorable:40e4aed"
	"github.com/mattn/go-isatty:7fcbc72"
	"github.com/rogpeppe/rog-go:f57ad5e"
	"github.com/smartystreets/mafsa:ab6b5ab"
	"github.com/sqs/fileset:af79d58"
	"github.com/sqs/go-selfupdate:d36f0a9"
	"github.com/golang/net:6c89489 -> golang.org/x"
	"github.com/golang/sys:b4e2899 -> golang.org/x"
	"github.com/golang/tools:5a22c00 -> golang.org/x"
	"github.com/grpc/grpc-go:f7d1653 -> google.golang.org"
	"github.com/inconshreveable/go-update:d8b0b1d -> gopkg.in/inconshreveable/go-update.v0"
	"github.com/sourcegraph/go-flags:6042383 -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/makex:9a03b09 -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/rwvfs:530b504 -> sourcegraph.com/sourcegraph"
	"github.com/sqs/pbtypes:f9723c8 -> sourcegraph.com/sqs"
)

inherit golang-single

DESCRIPTION="A hackable, multilange code analysis library for building better software tools"
HOMEPAGE="http://srclib.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
