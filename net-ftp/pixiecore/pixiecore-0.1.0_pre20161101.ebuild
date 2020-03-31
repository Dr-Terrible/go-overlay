# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/google"
GOLANG_PKG_IMPORTPATH_ALIAS="go.universe.tf"
GOLANG_PKG_NAME="netboot"
GOLANG_PKG_VERSION="57a1c9bea27f5d542444c409a768b331fc5e0cb9"
GOLANG_PKG_BUILDPATH="/cmd/pixiecore"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/spf13/afero:06b7e5f"
	"github.com/spf13/cast:2580bc9"
	"github.com/spf13/jWalterWeatherman:33c24e7"
	"github.com/spf13/pflag:5ccb023"
	"github.com/spf13/cobra:6e91dde"
	"github.com/spf13/viper:651d9d9"
	"github.com/fsnotify/fsnotify:629574c" #v1.4.2
	"github.com/hashicorp/hcl:973f376"
	"github.com/magiconair/properties:c265cfa" #v1.7.0
	"github.com/mitchellh/mapstructure:f3009df"
	"github.com/pelletier/go-toml:64ff1ea" #0.3.5
	"github.com/pelletier/go-buffruneio:df1e16f"
	"github.com/go-yaml/yaml:a5b47d3 -> gopkg.in/yaml.v2"
	"github.com/golang/net:f4b625e -> golang.org/x"
	"github.com/golang/crypto:1f22c01 -> golang.org/x"
	"github.com/golang/sys:9a2e24c -> golang.org/x"
	"github.com/golang/text:a263ba8 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="PXE booting for people in a hurry"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/spf13/jWalterWeatherman" \
		"github.com/spf13/jwalterweatherman"
}
