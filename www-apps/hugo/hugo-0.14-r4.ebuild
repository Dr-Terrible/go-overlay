# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/spf13"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_VERSION="${PV}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"bitbucket.org/pkg/inflect:8961c3750a47"
	"github.com/BurntSushi/toml:056c9bc7be"
	"github.com/PuerkitoBio/purell:d69616f51c"
	"github.com/dchest/cssmin:a22e1d8dac"
	"github.com/eknkc/amber:ee5a5b8364"
	"github.com/gorilla/websocket:a3ec486e6a"
	"github.com/kardianos/osext:6e7f843663"
	"github.com/miekg/mmark:3554509431"
	"github.com/mitchellh/mapstructure:bb4fbaf540"
	"github.com/russross/blackfriday:8cec3a854e"
	"github.com/opennota/urlesc:5fa9ff0392"
	"github.com/shurcooL/sanitized_anchor_name:11a20b799b"
	"github.com/spf13/afero:e54aac2c6a"
	"github.com/spf13/cast:4d07383ffe"
	"github.com/spf13/cobra:312092086b"
	"github.com/spf13/fsync:1fdf08f822b"
	"github.com/spf13/nitro:24d7ef30a1"
	"github.com/spf13/viper:be5ff3e484"
	"github.com/spf13/pflag:5644820622"
	"github.com/spf13/jWalterWeatherman:3d60171a64"
	"github.com/yosssi/ace:78e48a2f0a"
	"github.com/go-fsnotify/fsnotify:96c060f6a6 -> gopkg.in/fsnotify.v1"
	"github.com/go-yaml/yaml:f7716cb -> gopkg.in/yaml.v2"
	"github.com/inconshreveable/mousetrap:76626ae9c9"
	"github.com/kr/pretty:e6ac2fc51e"
	"github.com/kr/text:e373e137fa"
	"github.com/magiconair/properties:6240095988"
	"github.com/stretchr/testify:232e856367"
)

inherit golang-single

DESCRIPTION="A fast and flexible static site generator built in GoLang"
HOMEPAGE="http://gohugo.io"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE+=" pygments"

RDEPEND="pygments? ( dev-python/pygments )"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/spf13/jWalterWeatherman" \
		"github.com/spf13/jwalterweatherman"
}
