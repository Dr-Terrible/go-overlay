# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/jfrazelle"
GOLANG_PKG_VERSION="861338342b85c96acbdf6edf1029e917ce949030"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/Sirupsen/logrus:418b41d" #v0.8.7
	"github.com/boltdb/bolt:ee716d1" #v1.1.0
	"github.com/codegangsta/cli:c31a797" # wants HEAD snapshot
	"github.com/golang/protobuf:2402d76"
	"github.com/hpcloud/tail:1a0242e"
	"github.com/golang/net:c93a9b4 -> golang.org/x"
	"github.com/grpc/grpc-go:5da22b9"
	"github.com/go-fsnotify/fsnotify:8611c35 -> gopkg.in/fsnotify.v1" # v1.2.9
	"github.com/go-tomb/tomb:dd63297 -> gopkg.in/tomb.v1"
)

inherit golang-single

DESCRIPTION="Ultimate job/build runner"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/grpc/grpc-go" \
		"google.golang.org/grpc"
}
