# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH}/${PN}/hugolib.BuildDate=$( date +%FT%T%z )"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bep/inflect:b896c45"
	"github.com/bep/gitmap:dcb907b"
	"github.com/BurntSushi/toml:9906417"
	"github.com/chaseadamsio/goorgeous:42b0ec1"
	"github.com/pelletier/go-toml:fee7787"
	"github.com/pelletier/go-buffruneio:c37440a"
	"github.com/PuerkitoBio/purell:0bcb03f"
	"github.com/PuerkitoBio/urlesc:5bd2802"
	"github.com/dchest/cssmin:fb8d9b4"
	"github.com/eknkc/amber:9be5e8a"
	"github.com/gorilla/websocket:adf16b3"
	"github.com/kardianos/osext:9b883c5"
	"github.com/miekg/mmark:2d4f1dd"
	"github.com/mitchellh/mapstructure:bfdb1a8"
	"github.com/russross/blackfriday:5f33e7b"
	"github.com/shurcooL/sanitized_anchor_name:1dba4b3"
	"github.com/spf13/afero:9be6508"
	"github.com/spf13/cast:ce135a4"
	"github.com/spf13/cobra:7be4bed"
	"github.com/spf13/fsync:12a01e6"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:7538d73"
	"github.com/spf13/pflag:9ff6c69"
	"github.com/spf13/jWalterWeatherman:fa7ca7e"
	"github.com/cpuguy83/go-md2man:a65d4d2" #v1.0.6
	"github.com/yosssi/ace:ea038f4"
	"github.com/fsnotify/fsnotify:4da3e2c"
	"github.com/go-yaml/yaml:a3f3340 -> gopkg.in/yaml.v2"
	"github.com/kr/fs:2788f0d"
	"github.com/pkg/sftp:4d0e916"
	"github.com/pkg/errors:248dadf"
	"github.com/magiconair/properties:9c47895"
	"github.com/golang/text:0ad425f -> golang.org/x"
	"github.com/golang/crypto:453249f -> golang.org/x"
	"github.com/golang/sys:075e574 -> golang.org/x"
	"github.com/golang/net:906cda9 -> golang.org/x"
	"github.com/hashicorp/hcl:80e628d"
	"github.com/kyokomi/emoji:7e06b23"
	"github.com/nicksnyder/go-i18n:fed5740"
	"github.com/inconshreveable/mousetrap:76626ae"

	# unit testing
	"github.com/stretchr/testify:4d4bfba"
	"github.com/fortytw2/leaktest:0db74e8"

)

inherit golang-single

DESCRIPTION="A fast and flexible static site generator built in GoLang"
HOMEPAGE="http://gohugo.io"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 arm"
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
