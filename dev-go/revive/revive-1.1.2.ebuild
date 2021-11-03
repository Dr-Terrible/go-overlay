# Copyright 1999-2021 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="A linter for Go. A drop-in replacement for golint"
HOMEPAGE="https://github.com/mgechev/revive"

EGO_SUM=(
	"github.com/BurntSushi/toml v0.4.1"
	"github.com/BurntSushi/toml v0.4.1/go.mod"
	"github.com/chavacava/garif v0.0.0-20210405164556-e8a0a408d6af"
	"github.com/chavacava/garif v0.0.0-20210405164556-e8a0a408d6af/go.mod"
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/fatih/color v1.13.0"
	"github.com/fatih/color v1.13.0/go.mod"
	"github.com/fatih/structtag v1.2.0"
	"github.com/fatih/structtag v1.2.0/go.mod"
	"github.com/mattn/go-colorable v0.1.9"
	"github.com/mattn/go-colorable v0.1.9/go.mod"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/go-isatty v0.0.14"
	"github.com/mattn/go-isatty v0.0.14/go.mod"
	"github.com/mattn/go-runewidth v0.0.9"
	"github.com/mattn/go-runewidth v0.0.9/go.mod"
	"github.com/mgechev/dots v0.0.0-20210922191527-e955255bf517"
	"github.com/mgechev/dots v0.0.0-20210922191527-e955255bf517/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/olekukonko/tablewriter v0.0.5"
	"github.com/olekukonko/tablewriter v0.0.5/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.7.0"
	"github.com/stretchr/testify v1.7.0/go.mod"
	"github.com/yuin/goldmark v1.4.0/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/mod v0.4.2"
	"golang.org/x/mod v0.4.2/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20210805182204-aaa1db679c0d/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20210809222454-d867a43fc93e"
	"golang.org/x/sys v0.0.0-20210809222454-d867a43fc93e/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.1.7"
	"golang.org/x/tools v0.1.7/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c"
	"gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c/go.mod"
	)
go-module_set_globals

SRC_URI="https://github.com/mgechev/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 x86"
IUSE="pie debug"

DOCS=(
	CONTRIBUTING.md
	DEVELOPING.md
	PULL_REQUEST_TEMPLATE.md
	README.md
	RULES_DESCRIPTIONS.md
)

src_compile() {
	go build \
		-ldflags="$(usex debug '' -w) $(usex debug '' -s) -X main.version=${PV} -X main.date=$( date -u '+%Y-%m-%d' ) -X main.commit=111721b -X main.builtBy=Gentoo" \
		-buildmode="$(usex pie pie default)" \
		-trimpath \
		-o bin/${PN} . \
		|| die "compile failed"
}

src_install() {
	dobin bin/*

	insinto "/usr/share/${P}/examples"
	newins   defaults.toml ${PN}.toml

	einstalldocs
}

pkg_postinst() {
	einfo "An example configuration file can be found at '/usr/share/${P}/examples'"
	einfo "${PN} expects it at '\$HOME/revive.toml'."
}
