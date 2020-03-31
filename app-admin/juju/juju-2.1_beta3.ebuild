# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_4,3_5,3_6} )

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_VERSION="${P//_beta/-beta}"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/Azure/azure-sdk-for-go:902d95d"
	"github.com/Azure/go-autorest:6f40a8a"
	"github.com/ajstarks/svgo:89e3ac6"
	"github.com/altoros/gosigma:3122893"
	"github.com/beorn7/perks:3ac7bf7"
	"github.com/bmizerany/pat:c068ca2"
	"github.com/coreos/go-systemd:7b2428f"
	"github.com/dgrijalva/jwt-go:01aeca5"
	"github.com/dustin/go-humanize:145fabd"
	"github.com/gabriel-samfira/sys:9ddc60d"
	"github.com/godbus/dbus:32c6cc2"
	"github.com/golang/protobuf:34a5f24"
	"github.com/google/go-querystring:9235644"
	"github.com/gorilla/schema:08023a0"
	"github.com/gorilla/websocket:13e4d06"
	"github.com/gosuri/uitable:36ee7e9"
	"github.com/joyent/gocommon:ade826b"
	"github.com/joyent/gosdc:2f11fea"
	"github.com/joyent/gosign:0da0d5f"
	"github.com/juju/ansiterm:b99631d"
	"github.com/juju/blobstore:0605600"
	"github.com/juju/bundlechanges:6791af0"
	"github.com/juju/cmd:1c6973d"
	"github.com/juju/errors:1b5e39b"
	"github.com/juju/jsonschema:a0ef8b7"
	"github.com/juju/gnuflag:4e76c56"
	"github.com/juju/go4:40d72ab"
	"github.com/juju/gojsonpointer:afe8b77"
	"github.com/juju/gojsonreference:f0d24ac"
	"github.com/juju/gojsonschema:e1ad140"
	"github.com/juju/gomaasapi:f0300c9"
	"github.com/vmware/govmomi:c0c7ce6"
	"github.com/juju/httpprof:14bf14c"
	"github.com/juju/httprequest:266fd1e"
	"github.com/juju/idmclient:3dda079"
	"github.com/juju/loggo:3b7ece4"
	"github.com/juju/mempool:24974d6"
	"github.com/juju/mutex:59c26ee"
	"github.com/juju/persistent-cookiejar:5243747"
	"github.com/juju/pubsub:9dcaca7"
	"github.com/juju/replicaset:6b5becf"
	"github.com/juju/retry:62c6203"
	"github.com/juju/rfc:ebdbbdb"
	"github.com/juju/romulus:bf7827f"
	"github.com/juju/schema:075de04"
	"github.com/juju/terms-client:9b925af"
	"github.com/juju/testing:5ea7716"
	"github.com/juju/txn:2889819"
	"github.com/juju/usso:68a59c9"
	"github.com/juju/utils:165eeed"
	"github.com/juju/version:1f41e27"
	"github.com/juju/webbrowser:54b8c57"
	"github.com/juju/xml:eb759a6"
	"github.com/juju/zip:f6b1e93"
	"github.com/julienschmidt/httprouter:77a895a"
	"github.com/lestrrat/go-jspointer:f4881e6"
	"github.com/lestrrat/go-jsref:e452c7b"
	"github.com/lestrrat/go-jsschema:b09d765"
	"github.com/lestrrat/go-jsval:b1258a1"
	"github.com/lestrrat/go-pdebug:2e6eaaa"
	"github.com/lestrrat/go-structinfo:f74c056"
	"github.com/lunixbochs/vtclean:4fbf763"
	"github.com/lxc/lxd:95a324a"
	"github.com/mattn/go-colorable:ed8eb9e"
	"github.com/mattn/go-isatty:66b8e73"
	"github.com/mattn/go-runewidth:d96d1bd"
	"github.com/matttproud/golang_protobuf_extensions:c12348c"
	"github.com/pkg/errors:839d9e9"
	"github.com/prometheus/client_golang:575f371"
	"github.com/prometheus/client_model:fa8ad6f"
	"github.com/prometheus/common:dd586c1"
	"github.com/prometheus/procfs:abf152e"
	"github.com/rogpeppe/fastuuid:6724a57"
	"github.com/golang/crypto:8e06e8d -> golang.org/x"
	"github.com/golang/net:ea47fc7 -> golang.org/x"
	"github.com/golang/oauth2:11c60b6 -> golang.org/x"
	"github.com/golang/text:2910a50 -> golang.org/x"
	"github.com/google/google-api-go-client:0d3983f"
	"github.com/GoogleCloudPlatform/google-cloud-go:f20d6dc"
	"github.com/go-amz/amz:1889906 -> gopkg.in/amz.v3"
	"github.com/go-check/check:4f90aea -> gopkg.in/check.v1"
	"github.com/go-errgo/errgo:66cb462 -> gopkg.in/errgo.v1"
	"github.com/go-goose/goose:8f055ce -> gopkg.in/goose.v1"
	"github.com/go-ini/ini:776aa73 -> gopkg.in/ini.v1"
	"github.com/juju/blobstore:51fa6e2 -> gopkg.in/juju/blobstore.v2"
	"github.com/juju/charm:83771c4 -> gopkg.in/juju/charm.v6-unstable"
	"github.com/juju/charmrepo:e79aa29 -> gopkg.in/juju/charmrepo.v2-unstable"
	"github.com/juju/charmstore:fd1eef3 -> gopkg.in/juju/charmstore.v5-unstable"
	"github.com/juju/environschema:7359fc7 -> gopkg.in/juju/environschema.v1"
	"github.com/juju/jujusvg:d821600 -> gopkg.in/juju/jujusvg.v2"
	"github.com/juju/names:3317ff7 -> gopkg.in/juju/names.v2"
	"github.com/go-macaroon-bakery/macaroon-bakery:469b44e -> gopkg.in/macaroon-bakery.v1"
	"github.com/go-macaroon/macaroon:ab3940c -> gopkg.in/macaroon.v1"
	"github.com/go-mgo/mgo:f2b6f6c -> gopkg.in/mgo.v2"
	"github.com/natefinch/lumberjack:514cbda -> gopkg.in/natefinch/lumberjack.v2"
	"github.com/natefinch/npipe:c1b8fa8 -> gopkg.in/natefinch/npipe.v2"
	"github.com/go-retry/retry:c09f6b8 -> gopkg.in/retry.v1"
	"github.com/go-tomb/tomb:dd63297 -> gopkg.in/tomb.v1"
	"github.com/go-yaml/yaml:9f9df34 -> gopkg.in/yaml.v1"
	"github.com/go-yaml/yaml:a83829b -> gopkg.in/yaml.v2"

	# Documentation
	"github.com/juju/docs:251e34c" #v2.1
)

inherit python-any-r1 golang-single

DESCRIPTION="juju is devops distilled"
HOMEPAGE="https://juju.ubuntu.com"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

RESTRICT+=" test"

RDEPEND="app-emulation/lxd"
DEPEND="dev-python/html2text
	dev-python/markdown
	dev-python/setuptools
	dev-python/mdx_callouts
	dev-python/mdx_anchors_away
	dev-python/mdx_foldouts"

pkg_setup() {
	use doc && python-any-r1_pkg_setup
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/google/google-api-go-client" \
		"google.golang.org/api"

	golang_fix_importpath_alias \
		"github.com/GoogleCloudPlatform/google-cloud-go" \
		"google.golang.org/cloud"
}

src_install() {
	golang-single_src_install

	# install docs
	if use doc; then
		pushd "${WORKDIR}"/gopath/src/github.com/juju/docs > /dev/null || die
			emake build
			dodoc -r htmldocs/en/*
		popd > /dev/null || die
	fi
}
