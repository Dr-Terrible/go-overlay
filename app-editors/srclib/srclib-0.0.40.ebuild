# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/sourcegraph"
GOLANG_PKG_IMPORTPATH_ALIAS="sourcegraph.com/sourcegraph"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_OUTPUT_NAME="src"
GOLANG_PKG_BUILDPATH="/cmd/src"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/petar/GoLLRB:53be0d36a8"
	"github.com/alecthomas/binary:21c37b530b"
	"github.com/alecthomas/unsafeslice:a2ace32dbd"
	"github.com/aybabtme/color:28ad4cc941"
	"github.com/fsouza/go-dockerclient:7b927cb79b"
	"github.com/gogo/protobuf:b9e369e8ff"
	"github.com/inconshreveable/go-update:68f5725818"
	"github.com/kr/fs:2788f0dbd1"
	"github.com/kr/binarydist:9955b0ab87"
	"github.com/peterh/liner:1bb0d1c1a2"
	"github.com/peterbourgon/diskv:72aa5da9f7"
	"github.com/smartystreets/mafsa:ab6b5abc58"
	"github.com/kardianos/osext:6e7f843663"
	"github.com/sourcegraph/httpcache:e2fdd7ddab"
	"github.com/sourcegraph/go-flags:ac1de6df8e -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/go-sourcegraph:e50888d324 -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/go-github:155bb734c5"
	"github.com/sourcegraph/mux:dd22f369d4"
	"github.com/sourcegraph/go-diff:7eefa0faf5 -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/go-nnz:62f271ba06 -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/go-vcs:7263331269 -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/makex:6c095447b8 -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/rwvfs:17219d9463 -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/vcsstore:e7025c91a3 -> sourcegraph.com/sourcegraph"
	"github.com/sqs/pbtypes:8c90263b5e -> sourcegraph.com/sqs"
	"github.com/sqs/fileset:4317e899aa"
	"github.com/google/go-querystring:547ef5ac97"
	"github.com/golang/tools:cc54cd6553 -> golang.org/x"
	"github.com/golang/protobuf:34a5f244f1"
	"github.com/gorilla/context:215affda49"
	"github.com/rogpeppe/rog-go:f57ad5e24a -> code.google.com/p"
)

inherit golang-single

DESCRIPTION="A hackable, multilange code analysis library for building better software tools"
HOMEPAGE="http://srclib.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"