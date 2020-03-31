# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/tcnksm"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/mitchellh/cli:8102d0ed5e"
	"github.com/tcnksm/go-gitconfig:d154598bac"
	"github.com/tcnksm/go-latest:86500ab136"
	"github.com/google/go-github:fccd5bb66f"
	"github.com/google/go-querystring:547ef5ac97"
	"github.com/hashicorp/go-version:999359b6b7"
	"github.com/golang/crypto:1e856cbfdf -> golang.org/x"
	"github.com/golang/net:669b27b881 -> golang.org/x"
	"github.com/codegangsta/cli:142e6cd241"
	"github.com/olekukonko/tablewriter:bc39950e08"
	"github.com/BurntSushi/toml:056c9bc7be"
)

inherit golang-single

DESCRIPTION="Gcli builds GoLang command-line applications"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND="dev-go/go-bindata
	test? ( dev-go/go-tools )"

PATCHES=(
	"${FILESDIR}/${PN}.patch"
)

src_compile() {
	pushd skeleton > /dev/null || die
	ebegin "Building binary data"
		go-bindata -pkg="skeleton" resource/... || die
	eend
	popd > /dev/null || die

	golang-single_src_compile
}

src_test() {
	dosym ${GOBIN} "${S}"/bin || die
	golang-single_src_test
}
