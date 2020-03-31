# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/nim4"
GOLANG_PKG_NAME="${PN//dbs/DBS}"
GOLANG_PKG_VERSION="${PV//_beta/-beta}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/boltdb/bolt:583e893" #v1.3.0
	"github.com/gorilla/securecookie:667fe4e" #v1.1
	"github.com/spf13/viper:5ed0fc3"
	"github.com/xwb1989/sqlparser:dbfc858"
	"github.com/fsnotify/fsnotify:629574c" #v1.4.2
	"github.com/hashicorp/hcl:80e628d"
	"github.com/magiconair/properties:c265cfa" #v1.7.0
	"github.com/mitchellh/mapstructure:bfdb1a8"
	"github.com/pelletier/go-toml:d464759" #v0.4.0
	"github.com/spf13/afero:90dd71e"
	"github.com/spf13/cast:56a7ecb"
	"github.com/spf13/jWalterWeatherman:33c24e7"
	"github.com/spf13/pflag:25f8b5b"
	"github.com/go-yaml/yaml:a5b47d3 -> gopkg.in/yaml.v2"
	"github.com/pelletier/go-buffruneio:df1e16f"
	"github.com/golang/sys:d75a526 -> golang.org/x"
	"github.com/golang/text:a49bea1 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Protects your data by inspecting incoming queries from your application server"
HOMEPAGE="http://nim4.github.io/DBShield"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/spf13/jWalterWeatherman" \
		"github.com/spf13/jwalterweatherman"
}

src_install() {
	golang-single_src_install
	dodoc conf/${PN}.yml
}
