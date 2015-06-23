# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/snappy:eaa750b9bf"
	"github.com/pborman/uuid:ed3ca8a15a"
	"github.com/badgerodon/peg:9e5f7f4d07"
	"github.com/barakmich/glog:fafcb6128a"
	"github.com/boltdb/bolt:04a3e85793"
	"github.com/julienschmidt/httprouter:8c199fb625"
	"github.com/peterh/liner:1bb0d1c1a2"
	"github.com/robertkrimen/otto:47082f4308"
	"github.com/russross/blackfriday:17bb7999de"
	"github.com/syndtr/goleveldb:a06509502c"
	"github.com/go-mgo/mgo:3569c88678"
	"github.com/shurcooL/sanitized_anchor_name:11a20b799b"

	# use test
	"github.com/cznic/mathutil:a804f0f2d8"
)

inherit golang-single

DESCRIPTION="Cayley is a graph databse written in GoLang."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE+=" examples"

src_prepare() {
	golang_fix_importpath_alias \
		"github.com/golang/snappy" \
		"github.com/google/go-snappy"

	golang_fix_importpath_alias \
		"github.com/pborman/uuid" \
		"code.google.com/p/go-uuid"

	golang_fix_importpath_alias \
		"github.com/go-mgo/mgo" \
		"gopkg.in/mgo.v2"
}

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