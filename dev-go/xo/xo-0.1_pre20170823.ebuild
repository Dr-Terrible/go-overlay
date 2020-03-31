# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/knq"
GOLANG_PKG_VERSION="5f9772caf852ad766eb989a5c870a1c224555840"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/alexflint/go-arg:0cc8e30"
	"github.com/gedex/inflector:16278e9"
	"github.com/go-sql-driver/mysql:02eb68a"
	"github.com/lib/pq:88edab0"
	"github.com/mattn/go-sqlite3:6c771bb" #v1.6.0
	"github.com/denisenkom/go-mssqldb:ee49270"
	"github.com/knq/dburl:2406b5c"
	"github.com/knq/snaker:d9ad1e7"
	"github.com/knq/xoutil:46189f4"
	"github.com/golang/crypto:91a49db -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A cli tool to generate Golang types and funcs based on a database schema"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="oracle postgres +sqlite mysql"

# Unit tests are broken
RESTRICT+=" test"

DEPEND=">=dev-go/go-bindata-3.0.7"
RDEPEND="${DEPEND}
	dev-go/go-tools"

src_compile() {
	# generate templates
	ebegin "Generating templates"
		sh tpl.sh || die
	eend $?

	use sqlite && GOLANG_PKG_TAGS+=" sqlite3"
	use postgres && GOLANG_PKG_TAGS+=" postgres"
	use mysql && GOLANG_PKG_TAGS+=" mysql"
	use oracle && GOLANG_PKG_TAGS+=" oracle"
	golang-single_src_compile
}
