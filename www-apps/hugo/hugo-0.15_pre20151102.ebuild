# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_VERSION="ca55ea505a2b87fe7c89a56d9f3f6b835f68aefc"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"bitbucket.org/pkg/inflect:8961c3750a47"
	"github.com/BurntSushi/toml:056c9bc7be"
	"github.com/PuerkitoBio/purell:d69616f51c"
	"github.com/dchest/cssmin:a22e1d8dac"
	"github.com/eknkc/amber:ee5a5b8364"
	"github.com/gorilla/websocket:5ed2f45"
	"github.com/kardianos/osext:6e7f843663"
	"github.com/miekg/mmark:3079af4"
	"github.com/mitchellh/mapstructure:281073e"
	"github.com/russross/blackfriday:ceb8293" #v1.3
	"github.com/opennota/urlesc:5fa9ff0392"
	"github.com/shurcooL/sanitized_anchor_name:244f5ac"
	"github.com/spf13/afero:6ced24d"
	"github.com/spf13/cast:ee815aaf95"
	"github.com/spf13/cobra:8b2293c"
	"github.com/spf13/fsync:1fdf08f822"
	"github.com/spf13/nitro:24d7ef30a1"
	"github.com/spf13/viper:1967d93db7"
	"github.com/spf13/pflag:08b1a58"
	"github.com/spf13/jWalterWeatherman:3d60171a64"
	"github.com/cpuguy83/go-md2man:71acacd42f"
	"github.com/yosssi/ace:a264e9d"
	"github.com/go-fsnotify/fsnotify:7be5420 -> gopkg.in/fsnotify.v1" #v1.2.1
	"github.com/go-yaml/yaml:53feefa -> gopkg.in/yaml.v2"
	"github.com/inconshreveable/mousetrap:76626ae9c9"
	"github.com/kr/pretty:e6ac2fc51e"
	"github.com/kr/text:bb797dc"
	"github.com/magiconair/properties:6ac0b95"
	"github.com/stretchr/testify:f3960ab"
	"github.com/golang/text:0fe7e68 -> golang.org/x"
)

inherit golang-single

EDOC_COMMIT="1d82be4bec7e4258050cf4aba50d0c32d7c22cbb"

DESCRIPTION="A fast and flexible static site generator built in GoLang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"
SRC_URI+=" doc? ( https://${GOLANG_PKG_IMPORTPATH}/${PN}/archive/${EDOC_COMMIT}.tar.gz -> ${P}-docs.tar.gz )"

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

	# Install documentation
	if use doc; then
		pushd docs
			${GOBIN}/${PN} \
				-d "${T}"/docs \
				-b file:///./ \
				--disableRSS=true \
				--disableSitemap=true \
				--noTimes=true \
				|| die
			dohtml -r "${T}"/docs/*
		popd
	fi
}
