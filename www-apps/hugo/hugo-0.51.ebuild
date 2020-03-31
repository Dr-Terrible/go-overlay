# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/go${PN}io"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/markbates/inflect:24b8319"       #v1.0.4
	"github.com/bep/gitmap:ecb6fe0"              #v1.0.0
	"github.com/bep/debounce:844797f"            #v1.1.0
	"github.com/bep/go-tocss:2abb118"            #v0.5.0
	"github.com/bep/mapstructure:bb74f1d"
	#"github.com/chaseadamsio/goorgeous:dcf1ef8"  #v1.1.0
	"github.com/BurntSushi/toml:a368813"
	"github.com/BurntSushi/locker:a6e239e"
	"github.com/chaseadamsio/goorgeous:dcf1ef8"  #v1.1.0
	"github.com/mattn/go-runewidth:ce7b0b5"      #v0.0.3
	"github.com/mattn/go-isatty:6ca4dbf"         #v0.0.4
	"github.com/pelletier/go-toml:acdc450"       #v1.1.0
	"github.com/PuerkitoBio/purell:0bcb03f"      #v1.0.1
	"github.com/PuerkitoBio/urlesc:de5bf2a"
	"github.com/alecthomas/chroma:5a47317"       #v0.6.0
	"github.com/alecthomas/assert:405dbfe"
	"github.com/alecthomas/colour:60882d9"
	"github.com/alecthomas/repr:117648c"
	"github.com/disintegration/imaging:0bd5694"  #v1.5.0
	"github.com/dlclark/regexp2:487489b"         #v1.1.6
	"github.com/eknkc/amber:cdade1c"
	"github.com/gorilla/websocket:66b9c49"       #v1.4.0
	"github.com/gobwas/glob:5ccd90e"             #v0.2.3
	"github.com/gobuffalo/envy:b29bf6b"          #v1.6.9
	"github.com/miekg/mmark:fd2f6c1"             #v1.3.6
	"github.com/mitchellh/mapstructure:3536a92"  #v1.1.2
	"github.com/mitchellh/hashstructure:a38c501" #v1.0.0
	"github.com/russross/blackfriday:46c73eb"
	"github.com/sanity-io/litter:ae543b7"        #v1.1.0
	"github.com/shurcooL/sanitized_anchor_name:86672fc"
	"github.com/spf13/afero:6364489"             #v1.1.1
	"github.com/spf13/cast:8965335"              #v1.2.0
	"github.com/spf13/cobra:be77323"
	"github.com/spf13/fsync:12a01e6"
	"github.com/spf13/nitro:24d7ef3"
	"github.com/spf13/viper:b5e8006"             #v1.0.2
	"github.com/spf13/pflag:e57e3ee"             #v1.0.0
	"github.com/spf13/jwalterweatherman:94f6ae3"
	"github.com/cpuguy83/go-md2man:20f5889"      #v1.0.8
	"github.com/danwakefield/fnmatch:cbb64ac"
	"github.com/yosssi/ace:ea038f4"              #v0.0.5
	"github.com/fsnotify/fsnotify:c282820"       #v1.4.7
	"github.com/go-yaml/yaml:5420a8b -> gopkg.in/yaml.v2"  #v2.2.1
	"github.com/magiconair/properties:c3beff4"   #v1.7.6
	"github.com/magefile/mage:49bafb8"           #v1.4.0
	"github.com/golang/image:c73c2af -> golang.org/x"
	"github.com/golang/text:f21a4df -> golang.org/x"  #v0.3.0
	"github.com/golang/sys:3b87a42 -> golang.org/x"
	"github.com/golang/sync:1d60e46 -> golang.org/x"
	"github.com/golang/net:161cd47 -> golang.org/x"
	"github.com/hashicorp/hcl:ef8a98b"
	"github.com/hashicorp/go-immutable-radix:27df809" #v1.0.0
	"github.com/hashicorp/golang-lru:0fb14ef"
	"github.com/kyokomi/emoji:2e9a950"             #v1.5.1
	"github.com/kr/pretty:73f6ac0"                 #v0.1.0
	"github.com/nicksnyder/go-i18n:0dc1626"        #v1.10.0
	"github.com/inconshreveable/mousetrap:76626ae" #v1.0
	"github.com/jdkato/prose:20d3663"              #v1.1.0
	"github.com/olekukonko/tablewriter:d4647c9"
	"github.com/pmezard/go-difflib:792786c"        #v1.0.0
	"github.com/muesli/smartcrop:f6ebaa7"
	"github.com/nfnt/resize:83c6a99"
	"github.com/pkg/errors:645ef00"                #v0.8.0
	"github.com/tdewolff/minify:2d0bbc9"           #v2.3.8
	"github.com/tdewolff/parse:e17a589"            #v2.3.5
	"github.com/go-check/check:788fd78 -> gopkg.in/check.v1"
	"github.com/joho/godotenv:23d116a"             #v1.3.0
	"github.com/wellington/go-libsass:615eaa4"

	# Docs
	"github.com/gohugoio/hugoDocs:f931d86" #v0.51

	# unit testing
	"github.com/stretchr/testify:04af852"
	"github.com/fortytw2/leaktest:a5ef704" #v1.2.0
	"github.com/davecgh/go-spew:346938d"   #v1.1.0
)

inherit golang-single

DESCRIPTION="A fast and flexible static site generator built in GoLang"
HOMEPAGE="https://gohugo.io"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE+=" doc pygments sass"

DEPEND=">=dev-lang/go-1.11"
RDEPEND="pygments? ( dev-python/pygments )"

pkg_setup() {
	GOLANG_PKG_LDFLAGS=" -X ${GOLANG_PKG_IMPORTPATH}/${PN}/hugolib.BuildDate=$( date +%FT%T%z )"
	if use sass; then
		GOLANG_PKG_TAGS="extended"
		GOLANG_PKG_USE_CGO=1
	fi
}

src_prepare() {
	golang-single_src_prepare

	# Fix for hardcoded URIs within docs
	sed -i \
		-e "s:introduction\/:introduction.html:" \
		-e "s:showcase\/:showcase.html:" \
		-e "s:press\/:press.html:" \
		-e "s:tools\/:tools/index.html:" \
		-e "s:commands\/:commands.html:" \
		-e "s:{{ .URL }}:{{ .URL }}/index.html:" \
		-e "s:href=\"/\" class=\"logo\":href=\"/index.html\" class=\"logo\":" \
		docs/config.toml \
		|| die
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
