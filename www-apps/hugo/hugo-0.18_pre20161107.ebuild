# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_VERSION="4d4c7791acce13e4ec4fcf2b8d763081dd52e219"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH}/${PN}/hugolib.BuildDate=$( date +%FT%T%z )"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bep/inflect:b896c45"
	"github.com/BurntSushi/toml:9906417"
	"github.com/pelletier/go-toml:45932ad"
	"github.com/pelletier/go-buffruneio:df1e16f"
	"github.com/PuerkitoBio/purell:8a29053"
	"github.com/PuerkitoBio/urlesc:5bd2802"
	"github.com/dchest/cssmin:fb8d9b4"
	"github.com/eknkc/amber:80f9e27"
	"github.com/gorilla/websocket:2d1e454"
	"github.com/kardianos/osext:c2c54e5"
	"github.com/miekg/mmark:701c11f"
	"github.com/mitchellh/mapstructure:a6ef2f0"
	"github.com/russross/blackfriday:5f33e7b"
	"github.com/shurcooL/sanitized_anchor_name:1dba4b3"
	"github.com/spf13/afero:52e4a6c"
	"github.com/spf13/cast:2580bc9"
	"github.com/spf13/cobra:9c28e4b"
	"github.com/spf13/fsync:1773df7"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:80ab665"
	"github.com/spf13/pflag:b83537d"
	"github.com/spf13/jWalterWeatherman:33c24e7"
	"github.com/cpuguy83/go-md2man:a65d4d2" #v1.0.6
	"github.com/yosssi/ace:ea038f4"
	"github.com/fsnotify/fsnotify:944cff2" #v1.4.1
	"github.com/go-yaml/yaml:a5b47d3 -> gopkg.in/yaml.v2"
	"github.com/kr/fs:2788f0d"
	"github.com/pkg/sftp:4d0e916"
	"github.com/pkg/errors:839d9e9"
	"github.com/magiconair/properties:0723e35"
	"github.com/golang/text:ede1cb9 -> golang.org/x"
	"github.com/golang/crypto:d172538 -> golang.org/x"
	"github.com/golang/sys:8d1157a -> golang.org/x"
	"github.com/golang/net:f4b625e -> golang.org/x"
	"github.com/hashicorp/hcl:6f5bfed"
	"github.com/kyokomi/emoji:17c5e70" #v1.4
	"github.com/nicksnyder/go-i18n:e6c90c3"

	# unit testing
	"github.com/stretchr/testify:f390dcf" #v1.1.3
	"github.com/fortytw2/leaktest:0db74e8"
)

inherit golang-single

DESCRIPTION="A fast and flexible static site generator built in GoLang"
HOMEPAGE="http://gohugo.io"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE+=" doc pygments"

RDEPEND="pygments? ( dev-python/pygments )"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/spf13/jWalterWeatherman" \
		"github.com/spf13/jwalterweatherman"

	# Fix for hardcoded URIs within docs
	sed -i \
		-e "s:introduction\/:introduction.html:" \
		-e "s:showcase\/:showcase.html:" \
		-e "s:press\/:press.html:" \
		-e "s:tools\/:tools/index.html:" \
		-e "s:commands\/:commands.html:" \
		-e "s:{{ .URL }}:{{ .URL }}/index.html:" \
		-e "s:href=\"/\" class=\"logo\":href=\"/index.html\" class=\"logo\":" \
		docs/layouts/index.html \
		docs/config.toml \
		docs/layouts/section/commands.html \
		docs/layouts/partials/header.html \
		|| die
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
			docinto html
			dodoc -r "${T}"/docs/*
		popd
	fi
}
