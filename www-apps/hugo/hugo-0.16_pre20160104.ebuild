# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_VERSION="f310492cb01b4c78aa3f47276bbe026a81496ebe"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"bitbucket.org/pkg/inflect:8961c3750a47"
	"github.com/BurntSushi/toml:056c9bc7be"
	"github.com/PuerkitoBio/purell:d69616f51c"
	"github.com/dchest/cssmin:a22e1d8dac"
	"github.com/eknkc/amber:144da19"
	"github.com/gorilla/websocket:361d4c0"
	"github.com/kardianos/osext:345163f"
	"github.com/miekg/mmark:9dca01c"
	"github.com/mitchellh/mapstructure:281073e"
	"github.com/russross/blackfriday:0b647d0" #v1.4
	"github.com/opennota/urlesc:5fa9ff0392"
	"github.com/shurcooL/sanitized_anchor_name:10ef21a"
	"github.com/spf13/afero:e7cb826"
	"github.com/spf13/cast:ee7b3e0"
	"github.com/spf13/cobra:b3f29e9"
	"github.com/spf13/fsync:c2544e7"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:110492b"
	"github.com/spf13/pflag:7f60f83"
	"github.com/spf13/jWalterWeatherman:c2aa07d"
	"github.com/cpuguy83/go-md2man:71acacd42f"
	"github.com/yosssi/ace:8e090bf"
	"github.com/go-fsnotify/fsnotify:2cdd39b -> gopkg.in/fsnotify.v1" #v1.2.5
	"github.com/go-yaml/yaml:53feefa -> gopkg.in/yaml.v2"
	"github.com/inconshreveable/mousetrap:76626ae9c9"
	"github.com/kr/pretty:e6ac2fc51e"
	"github.com/kr/text:bb797dc"
	"github.com/magiconair/properties:6ac0b95"
	"github.com/stretchr/testify:d797d25"
	"github.com/golang/text:4838fa4 -> golang.org/x"
	"github.com/hashicorp/hcl:197e8d3"

	# unit testing
	"github.com/davecgh/go-spew:5215b55"
	"github.com/pmezard/go-difflib:e8554b8"
)

inherit golang-single

DESCRIPTION="A fast and flexible static site generator built in GoLang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE+=" doc pygments"

RDEPEND="pygments? ( dev-python/pygments )"

use test && RESTRICT+=" sandbox"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/spf13/jWalterWeatherman" \
		"github.com/spf13/jwalterweatherman"
}

src_install() {
	golang-single_src_install

	# Install man pages
	${GOBIN}/${PN} gen man --dir="${T}"/man || die
	doman "${T}"/man/*

	# Install documentation
	if use doc; then
		pushd docs
			${GOBIN}/${PN} \
				-d "${T}"/docs \
				--baseURL="file:///usr/share/doc/${PF}/html/" \
				--canonifyURLs=true \
				--uglyURLs=true \
				--disableRSS=true \
				--disableSitemap=true \
				--noTimes=true \
				|| die
			dohtml -r "${T}"/docs/*
		popd
	fi
}

src_test() {
	if has sandbox $FEATURES && has network-sandox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
