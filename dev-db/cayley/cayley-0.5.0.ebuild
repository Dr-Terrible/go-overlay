# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/syndtr/gosnappy:156a073"
	"github.com/pborman/uuid:ca53cad"
	"github.com/badgerodon/peg:9e5f7f4"
	"github.com/barakmich/glog:fafcb61"
	"github.com/boltdb/bolt:04a3e85"
	"github.com/julienschmidt/httprouter:b59a380"
	"github.com/gogo/protobuf:58bbd41"
	"github.com/lib/pq:0dad96c"
	"github.com/peterh/liner:1bb0d1c"
	"github.com/robertkrimen/otto:d1b4d8e"
	"github.com/russross/blackfriday:17bb799"
	"github.com/syndtr/goleveldb:4875955"
	"github.com/go-mgo/mgo:c6a7dce -> gopkg.in/mgo.v2"
	"github.com/shurcooL/sanitized_anchor_name:8e87604"

	# unit tests
	"github.com/cznic/mathutil:f955143"
)

inherit golang-single

DESCRIPTION="Cayley is a graph databse written in GoLang."

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE+=" examples"

src_install() {
	golang-single_src_install

	# Install data files
	if use examples; then
		insinto /usr/share/${PN}
		doins data/*
	fi

	# Install configuration files
	keepdir /etc/${PN}
	insinto /etc/${PN}
	newins ${PN}.cfg.example ${PN}.cfg
}
