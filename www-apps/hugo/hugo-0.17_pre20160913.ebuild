# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_VERSION="7615ef0c2866d3068b131b9d6f80f8d432d54e13"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH}/${PN}/hugolib.BuildDate=$( date +%FT%T%z )"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/bep/inflect:b896c45"
	"github.com/BurntSushi/toml:9906417"
	"github.com/pelletier/go-toml:64ff1ea" #v0.3.5
	"github.com/pelletier/go-buffruneio:df1e16f"
	"github.com/PuerkitoBio/purell:8a29053"
	"github.com/PuerkitoBio/urlesc:5bd2802"
	"github.com/dchest/cssmin:fb8d9b4"
	"github.com/eknkc/amber:7875e96"
	"github.com/gorilla/websocket:5e2e56d"
	"github.com/kardianos/osext:29ae4ff"
	"github.com/miekg/mmark:adb5c3e"
	"github.com/mitchellh/mapstructure:21a35fb"
	"github.com/russross/blackfriday:93622da"
	"github.com/shurcooL/sanitized_anchor_name:10ef21a"
	"github.com/spf13/afero:cc9c218"
	"github.com/spf13/cast:e31f36f"
	"github.com/spf13/cobra:f62e98d"
	"github.com/spf13/fsync:1773df7"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:1699063"
	"github.com/spf13/pflag:1560c10"
	"github.com/spf13/jWalterWeatherman:33c24e7"
	"github.com/cpuguy83/go-md2man:2724a9c" #v1.0.5
	"github.com/yosssi/ace:ea038f4"
	"github.com/fsnotify/fsnotify:a8a77c9" #v1.3.1
	"github.com/go-yaml/yaml:e4d366f -> gopkg.in/yaml.v2"
	"github.com/kr/fs:2788f0d"
	"github.com/pkg/sftp:a71e8f5"
	"github.com/pkg/errors:01fa410" #v0.7.0
	"github.com/magiconair/properties:c265cfa" #v1.7.0
	"github.com/golang/text:2910a50 -> golang.org/x"
	"github.com/golang/crypto:bc89c49 -> golang.org/x"
	"github.com/golang/sys:a646d33 -> golang.org/x"
	"github.com/golang/net:28d1bd4 -> golang.org/x"
	"github.com/hashicorp/hcl:d8c773c"
	"github.com/kyokomi/emoji:17c5e70" #v1.4
	"github.com/nicksnyder/go-i18n:37e5c2d" #1.4.0

	# unit testing
	"github.com/stretchr/testify:f390dcf" #v1.1.3
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
