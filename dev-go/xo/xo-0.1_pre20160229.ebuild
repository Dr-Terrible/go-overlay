# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/knq"
GOLANG_PKG_VERSION="2284b40a411344029a0705a91793da89d0bb636c"
#GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/alexflint/go-arg:aaae155"
	"github.com/gedex/inflector:8c0e579"
	"github.com/go-sql-driver/mysql:71f003c"
	"github.com/lib/pq:69552e5"
	"github.com/mattn/go-sqlite3:09d5c45"
	"github.com/serenize/snaker:d88cc11"
)

inherit golang-single

DESCRIPTION="A cli tool to generate Golang types and funcs based on a database schema"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Unit tests are broken
RESTRICT+=" test"

CDEPEND="dev-db/sqlite:3"
DEPEND="${CDEPEND}
	>=dev-lang/go-1.5.3
	dev-go/go-bindata"
RDEPEND="${CDEPEND}
	dev-util/go-tools"

src_compile() {
	# generate templates
	ebegin "Generating templates"
		sh tpl.sh || die
	eend $?

	golang-single_src_compile
}
