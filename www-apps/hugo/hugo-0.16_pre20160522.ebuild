# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_VERSION="efae41c18659f29029f09f86876b4f9c28e7a181"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/bep/inflect:b896c45"
	"github.com/BurntSushi/toml:056c9bc7be"
	"github.com/PuerkitoBio/purell:d69616f51c"
	"github.com/dchest/cssmin:a22e1d8dac"
	"github.com/eknkc/amber:144da19"
	"github.com/gorilla/websocket:361d4c0"
	"github.com/kardianos/osext:345163f"
	"github.com/miekg/mmark:9dca01c"
	"github.com/mitchellh/mapstructure:281073e"
	"github.com/russross/blackfriday:b43df97"
	"github.com/opennota/urlesc:5fa9ff0392"
	"github.com/shurcooL/sanitized_anchor_name:10ef21a"
	"github.com/spf13/afero:f0b36a9"
	"github.com/spf13/cast:27b586b"
	"github.com/spf13/cobra:f368244"
	"github.com/spf13/fsync:eefee59"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:d8a428b"
	"github.com/spf13/pflag:cb88ea7"
	"github.com/spf13/jWalterWeatherman:33c24e7"
	"github.com/cpuguy83/go-md2man:71acacd" #v1.0.4
	"github.com/yosssi/ace:71afeb7"
	"github.com/fsnotify/fsnotify:30411db" #v1.3.0
	"github.com/go-yaml/yaml:a83829b -> gopkg.in/yaml.v2"
	"github.com/inconshreveable/mousetrap:76626ae9c9"
	"github.com/kr/pretty:add1dbc"
	"github.com/kr/text:bb797dc"
	"github.com/kr/fs:2788f0d"
	"github.com/pkg/sftp:e84cc8c"
	"github.com/magiconair/properties:6ac0b95"
	"github.com/stretchr/testify:d797d25"
	"github.com/golang/text:1b466db -> golang.org/x"
	"github.com/golang/crypto:c197bcf -> golang.org/x"
	"github.com/golang/sys:d4feaf1 -> golang.org/x"
	"github.com/hashicorp/hcl:32f2911"
	"github.com/kyokomi/emoji:1ee4529"

	# unit testing
	"github.com/davecgh/go-spew:5215b55"
	"github.com/pmezard/go-difflib:e8554b8"
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

src_test() {
	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
