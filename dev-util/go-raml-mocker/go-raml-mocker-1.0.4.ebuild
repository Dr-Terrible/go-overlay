# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/tsaikd"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/Sirupsen/logrus:4b6ea73" #v0.10.0
	"github.com/gorilla/websocket:1f512fc" #v1.0.0
	"github.com/tsaikd/KDGoLib:d13860a"
	"github.com/tsaikd/gin:6a14b8a"
	"github.com/tsaikd/go-raml-parser:92a78db"
	"github.com/fsnotify/fsnotify:629574c -> gopkg.in/fsnotify.v1" #v1.4.2
	"github.com/go-playground/validator:5f57d22  -> gopkg.in/go-playground/validator.v8" #v8.18.1
	"github.com/go-yaml/yaml:a5b47d3 -> gopkg.in/yaml.v2"
	"github.com/codegangsta/inject:33e0aa1"
	"github.com/gin-gonic/gin:3900df0"
	"github.com/hashicorp/go-version:deeb027"
	"github.com/hashicorp/hcl:6f5bfed"
	"github.com/golang/protobuf:98fa357"
	"github.com/jmoiron/sqlx:05b81a7"
	"github.com/kardianos/osext:c2c54e5"
	"github.com/lib/pq:ae8357d"
	"github.com/manucorporat/sse:ee05b12"
	"github.com/spf13/cobra:9c28e4b"
	"github.com/spf13/pflag:b83537d"
	"github.com/spf13/viper:80ab665"
	"github.com/spf13/afero:52e4a6c"
	"github.com/spf13/cast:2580bc9"
	"github.com/spf13/jWalterWeatherman:33c24e7"
	"github.com/kr/fs:2788f0d"
	"github.com/tsaikd/yaml:264768f"
	"github.com/golang/net:65dfc08 -> golang.org/x"
	"github.com/golang/text:ede1cb9 -> golang.org/x"
	"github.com/golang/crypto:d172538 -> golang.org/x"
	"github.com/golang/sys:8d1157a -> golang.org/x"
	"github.com/magiconair/properties:c265cfa" #v1.7.0
	"github.com/mitchellh/mapstructure:a6ef2f0"
	"github.com/pelletier/go-toml:45932ad"
	"github.com/pelletier/go-buffruneio:df1e16f"
	"github.com/pkg/sftp:4d0e916"
	"github.com/pkg/errors:839d9e9"
)

inherit golang-single

DESCRIPTION="RAML (1.0) web mock server implementation in Go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/spf13/jWalterWeatherman" \
		"github.com/spf13/jwalterweatherman"
}
