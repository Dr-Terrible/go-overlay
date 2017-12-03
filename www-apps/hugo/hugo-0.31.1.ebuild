# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/go${PN}io"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/markbates/inflect:ea17041"
	"github.com/bep/gitmap:dcb907b"
	"github.com/BurntSushi/toml:a368813"
	"github.com/chaseadamsio/goorgeous:7daffad"
	"github.com/pelletier/go-toml:2009e44"
	"github.com/pelletier/go-buffruneio:c37440a"
	"github.com/PuerkitoBio/purell:fd18e05"
	"github.com/PuerkitoBio/urlesc:de5bf2a"
	"github.com/alecthomas/chroma:9c81d25"
	"github.com/dchest/cssmin:fb8d9b4"
	"github.com/dlclark/regexp2:7632a26"
	"github.com/eknkc/amber:4ed0bf7"
	"github.com/gorilla/websocket:4201258"
	"github.com/kardianos/osext:ae77be6"
	"github.com/miekg/mmark:057eb9e"
	"github.com/mitchellh/mapstructure:d0303fe"
	"github.com/russross/blackfriday:6d1ef89"
	"github.com/shurcooL/sanitized_anchor_name:86672fc"
	"github.com/spf13/afero:8d919cb" #v1.0.0
	"github.com/spf13/cast:acbeb36"
	"github.com/spf13/cobra:0dacccf"
	"github.com/spf13/fsync:12a01e6"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:d9cca5e"
	"github.com/spf13/pflag:be7121d"
	"github.com/spf13/jWalterWeatherman:12bd96e"
	"github.com/cpuguy83/go-md2man:1d903dc" #v1.0.7
	"github.com/danwakefield/fnmatch:cbb64ac"
	"github.com/yosssi/ace:ea038f4"
	"github.com/fsnotify/fsnotify:4da3e2c"
	"github.com/go-yaml/yaml:eb3733d -> gopkg.in/yaml.v2"
	"github.com/kr/fs:2788f0d"
	"github.com/pkg/sftp:4d0e916"
	"github.com/pkg/errors:248dadf"
	"github.com/magiconair/properties:8d7837e"
	"github.com/magefile/mage:2f97430"
	"github.com/golang/image:334384d -> golang.org/x"
	"github.com/golang/text:1cbadb4 -> golang.org/x"
	"github.com/golang/crypto:453249f -> golang.org/x"
	"github.com/golang/sys:314a259 -> golang.org/x"
	"github.com/golang/net:0a93976 -> golang.org/x"
	"github.com/hashicorp/hcl:68e816d"
	"github.com/hashicorp/go-immutable-radix:8aac270"
	"github.com/hashicorp/golang-lru:0a025b7"
	"github.com/kyokomi/emoji:ddd4753"
	"github.com/nicksnyder/go-i18n:0dc1626"
	"github.com/inconshreveable/mousetrap:76626ae"
	"github.com/jdkato/prose:2f88f08"

	# Docs
	"github.com/gohugoio/hugoDocs:19d3ea0" #v0.30.2

	# unit testing
	"github.com/stretchr/testify:890a5c3"
	"github.com/fortytw2/leaktest:3b724c3"

)

inherit golang-single

DESCRIPTION="A fast and flexible static site generator built in GoLang"
HOMEPAGE="http://gohugo.io"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE+=" doc pygments"

RDEPEND="pygments? ( dev-python/pygments )"

pkg_setup() {
	GOLANG_PKG_LDFLAGS=" -X ${GOLANG_PKG_IMPORTPATH}/${PN}/hugolib.BuildDate=$( date +%FT%T%z )"
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/spf13/jWalterWeatherman" \
		"github.com/spf13/jwalterweatherman"

	# Fix for hardcoded URIs within docs
#	sed -i \
#		-e "s:introduction\/:introduction.html:" \
#		-e "s:showcase\/:showcase.html:" \
#		-e "s:press\/:press.html:" \
#		-e "s:tools\/:tools/index.html:" \
#		-e "s:commands\/:commands.html:" \
#		-e "s:{{ .URL }}:{{ .URL }}/index.html:" \
#		-e "s:href=\"/\" class=\"logo\":href=\"/index.html\" class=\"logo\":" \
#		docs/config.toml \
#		|| die
}

src_install() {
	golang-single_src_install

	# Install man pages
	${GOBIN}/${PN} gen man --dir="${T}"/man || die
	doman "${T}"/man/*

	# Install documentation
	if use doc; then
		# FIXME: this is really bad!
		if has network-sandbox $FEATURES; then
			eerror "Doc generation require 'network-sandbox' to be disabled in FEATURES."
		fi
		pushd "${GOPATH}"/src/github.com/gohugoio/hugoDocs > /dev/null || die
			${GOBIN}/${PN} \
				-d "${T}"/docs \
				--baseURL="file:///usr/share/doc/${PF}/html/" \
				--canonifyURLs=true \
				--uglyURLs=true \
				--disableKinds=404 \
				--disableKinds=RSS \
				--disableKinds=sitemap \
				--noTimes=true \
				--enableGitInfo=false \
				--verbose \
				|| die
			docinto html
			dodoc -r "${T}"/docs/*
		popd > /dev/null || die
	fi
}

src_test() {
	if has network-sandbox $FEATURES; then
		eerror "Some tests require 'network-sandbox' to be disabled in FEATURES."
	fi
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
