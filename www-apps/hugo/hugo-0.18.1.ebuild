# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH}/${PN}/hugolib.BuildDate=$( date +%FT%T%z )"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bep/inflect:b896c45"
	"github.com/bep/gitmap:a1a71ab"
	"github.com/BurntSushi/toml:9906417"
	"github.com/pelletier/go-toml:017119f"
	"github.com/pelletier/go-buffruneio:df1e16f"
	"github.com/PuerkitoBio/purell:0bcb03f"
	"github.com/PuerkitoBio/urlesc:5bd2802"
	"github.com/dchest/cssmin:fb8d9b4"
	"github.com/eknkc/amber:a69a021"
	"github.com/gorilla/websocket:e8f0f8a"
	"github.com/kardianos/osext:c2c54e5"
	"github.com/miekg/mmark:2d4f1dd"
	"github.com/mitchellh/mapstructure:f3009df"
	"github.com/russross/blackfriday:5f33e7b"
	"github.com/shurcooL/sanitized_anchor_name:1dba4b3"
	"github.com/spf13/afero:06b7e5f"
	"github.com/spf13/cast:24b6558"
	"github.com/spf13/cobra:6b74a60"
	"github.com/spf13/fsync:cb2da33"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:651d9d9"
	"github.com/spf13/pflag:5ccb023"
	"github.com/spf13/jWalterWeatherman:33c24e7"
	"github.com/cpuguy83/go-md2man:a65d4d2" #v1.0.6
	"github.com/yosssi/ace:ea038f4"
	"github.com/fsnotify/fsnotify:fd9ec7d"
	"github.com/go-yaml/yaml:a5b47d3 -> gopkg.in/yaml.v2"
	"github.com/kr/fs:2788f0d"
	"github.com/pkg/sftp:4d0e916"
	"github.com/pkg/errors:839d9e9"
	"github.com/magiconair/properties:0723e35"
	"github.com/golang/text:a263ba8 -> golang.org/x"
	"github.com/golang/crypto:d172538 -> golang.org/x"
	"github.com/golang/sys:b699b70 -> golang.org/x"
	"github.com/golang/net:4971afd -> golang.org/x"
	"github.com/hashicorp/hcl:c3e054b"
	"github.com/kyokomi/emoji:17c5e70" #v1.4
	"github.com/nicksnyder/go-i18n:991e81c"

	# unit testing
	"github.com/stretchr/testify:69483b4" #v1.1.4
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
		pushd docs > /dev/null || die
			${GOBIN}/${PN} \
				-d "${T}"/docs \
				--baseURL="file:///usr/share/doc/${PF}/html/" \
				--canonifyURLs=true \
				--uglyURLs=true \
				--disable404 \
				--disableRSS=true \
				--disableSitemap=true \
				--noTimes=true \
				--enableGitInfo=false \
				|| die
			docinto html
			dodoc -r "${T}"/docs/*
		popd > /dev/null || die
	fi
}
