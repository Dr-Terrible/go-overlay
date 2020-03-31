# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/dinedal"
GOLANG_PKG_VERSION="209924e1c31cedd133ec3a66f0a14e43cb98f114"
GOLANG_PKG_LDFLAGS="-X main.VERSION=${PV}"
GOLANG_PKG_TAGS="libsqlite3 linux"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mattn/go-runewidth:9e777a8" #v0.0.2
	"github.com/olekukonko/tablewriter:65fec0d"
	"github.com/mattn/go-sqlite3:ed69081" #v1.4.0
	"github.com/golang/net:d866cfc -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Execute SQL against structured text like CSV or TSV"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="icu"

RDEPEND="dev-db/sqlite:3=[icu?]
	icu? ( dev-libs/icu:0= )"

src_compile() {
	use icu && GOLANG_PKG_TAGS+=" icu"
	golang-single_src_compile
}
