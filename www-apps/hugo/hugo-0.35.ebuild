# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/go${PN}io"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/markbates/inflect:a12c3ae"
	"github.com/bep/gitmap:de8030e"
	"github.com/BurntSushi/toml:a368813"
	"github.com/chaseadamsio/goorgeous:dcf1ef8"  #v1.1.0
	"github.com/mattn/go-runewidth:9e777a8"      #v0.0.2
	"github.com/pelletier/go-toml:acdc450"       #v1.1.0
	"github.com/PuerkitoBio/purell:0bcb03f"      #v1.0.1
	"github.com/PuerkitoBio/urlesc:de5bf2a"
	"github.com/alecthomas/chroma:e0f32fb"       #v0.2.1
	"github.com/disintegration/imaging:dd50a3e"  #v1.2.4
	"github.com/dlclark/regexp2:487489b"         #v1.1.6
	"github.com/eknkc/amber:cdade1c"
	"github.com/gorilla/websocket:ea4d1f6"       #v1.2.0
	"github.com/gobwas/glob:bea32b9"             #v0.2.2
	"github.com/miekg/mmark:fd2f6c1"             #v1.3.6
	"github.com/mitchellh/mapstructure:b4575ee"
	"github.com/russross/blackfriday:4048872"    #v1.5
	"github.com/shurcooL/sanitized_anchor_name:86672fc"
	"github.com/spf13/afero:bb8f192"             #v1.0.2
	"github.com/spf13/cast:acbeb36"              #v1.1.0
	"github.com/spf13/cobra:b95ab73"
	"github.com/spf13/fsync:12a01e6"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:25b30aa"             #v1.0.0
	"github.com/spf13/pflag:e57e3ee"             #v1.0.0
	"github.com/spf13/jWalterWeatherman:7c0cea3"
	"github.com/cpuguy83/go-md2man:1d903dc"      #v1.0.7
	"github.com/danwakefield/fnmatch:cbb64ac"
	"github.com/yosssi/ace:ea038f4"              #v0.0.5
	"github.com/fsnotify/fsnotify:c282820"       #v1.4.7
	"github.com/go-yaml/yaml:d670f94 -> gopkg.in/yaml.v2"
	"github.com/magiconair/properties:d419a98"   #v1.7.4
	"github.com/magefile/mage:2f97430"           #v1.0.2
	"github.com/golang/image:12117c1 -> golang.org/x"
	"github.com/golang/text:e19ae14 -> golang.org/x"
	"github.com/golang/sys:810d700 -> golang.org/x"
	"github.com/golang/sync:fd80eb9 -> golang.org/x"
	"github.com/golang/net:2fb46b1 -> golang.org/x"
	"github.com/hashicorp/hcl:23c074d"
	"github.com/hashicorp/go-immutable-radix:8aac270"
	"github.com/hashicorp/golang-lru:0a025b7"
	"github.com/kyokomi/emoji:7e06b23"             #v1.5
	"github.com/nicksnyder/go-i18n:0dc1626"        #v1.10.0
	"github.com/inconshreveable/mousetrap:76626ae" #v1.0
	"github.com/jdkato/prose:20d3663"              #v1.1.0
	"github.com/olekukonko/tablewriter:96aac99"
	"github.com/pmezard/go-difflib:792786c"        #v1.0.0

	# Docs
	"github.com/gohugoio/hugoDocs:f66d13a" #v0.35

	# unit testing
	"github.com/stretchr/testify:b91bfb9"  #v1.2.0
	"github.com/fortytw2/leaktest:7dad533" #v1.1.0
	"github.com/davecgh/go-spew:346938d"   #v1.1.0
)

inherit golang-single

DESCRIPTION="A fast and flexible static site generator built in GoLang"
HOMEPAGE="https://gohugo.io"

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
			HUGO_UGLYURLS=true \
			HUGO_CANONIFYURLS=true \
			${GOBIN}/${PN} \
				-d "${T}"/docs \
				--baseURL="file:///usr/share/doc/${PF}/html/" \
				--disableKinds=404 \
				--disableKinds=RSS \
				--disableKinds=sitemap \
				--noTimes=true \
				--enableGitInfo=false \
				--verbose
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
