# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/pingcap"
GOLANG_PKG_VERSION="${PV}-alpha"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	#"github.com/pingcap/go-hbase:7a98d1f"
	"github.com/pingcap/go-hbase:528dd26"
	#"github.com/pingcap/go-themis:dbb9966"
	"github.com/pingcap/go-themis:a143501"
	"github.com/golang/protobuf:6aaa8d4"
	"github.com/ngaut/go-zookeeper:9c3719e"
	"github.com/ngaut/tso:3e62d37"
	"github.com/ngaut/deadline:fae8f9d"
	"github.com/ngaut/zkhelper:6738bdc"
	"github.com/coreos/etcd:bdee27b" #v2.2.4
	"github.com/coreos/go-etcd:003851b"
	"github.com/ngaut/pools:6352e00"
	"github.com/ngaut/sync2:7a24ed7"
	"github.com/ugorji/go:646ae4a"
)

inherit golang-single

DESCRIPTION="TiDB is a distributed SQL database compatible with MySQL protocol"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="sys-apps/coreutils
	dev-util/goyacc
	dev-util/golex"

src_prepare() {
	golang-single_src_prepare

	# generate lexer/parser
	local TMPFILE="$( mktemp temp.XXXXXX )"
	goyacc -o /dev/null -xegen ${TMPFILE} parser/parser.y || die
	goyacc -o parser/parser.go -xe ${TMPFILE} parser/parser.y || die
	golex -o parser/scanner.go parser/scanner.l || die
}
