# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_VERSION="91e0c2b1feb2a7a1b074784a41249139b2fae975"
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
	"github.com/russross/blackfriday:0b647d0" #v1.4
	"github.com/opennota/urlesc:5fa9ff0392"
	"github.com/shurcooL/sanitized_anchor_name:244f5ac"
	"github.com/spf13/afero:3f6f746"
	"github.com/spf13/cast:ee815aaf95"
	"github.com/spf13/cobra:cb63a06"
	"github.com/spf13/fsync:a187c34"
	"github.com/spf13/nitro:24d7ef30a1"
	"github.com/spf13/viper:e37b56e"
	"github.com/spf13/pflag:08b1a58"
	"github.com/spf13/jWalterWeatherman:c2aa07d"
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
