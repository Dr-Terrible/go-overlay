# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/rgburke"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_VERSION="31baa08e744227ac6a3b9b984dc8b47344f71835"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bradfitz/slice:d9036e2"
	"github.com/camlistore/go4:034d17a"
	"github.com/gobwas/glob:bea32b9" #v0.2.2
	"github.com/golang/crypto:b080dc9 -> golang.org/x"
	"github.com/golang/sys:4ff8c00 -> golang.org/x"
	"github.com/mattn/go-runewidth:97311d9"
	"github.com/rgburke/goncurses:9a788ac"
	"github.com/rjeczalik/notify:767eb67"
	"github.com/Sirupsen/logrus:95cd2b9"
	"github.com/tchap/go-patricia:666120d" #v2.2.6
	"github.com/libgit2/git2go:334260d -> gopkg.in/libgit2/git2go.v25"

	# unit testing
	"github.com/stretchr/testify:2aa2c17"
)

inherit golang-single

DESCRIPTION="GRV is a terminal interface for viewing git repositories"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libgit2
	sys-libs/ncurses:0
	sys-libs/readline:0
"
RDEPEND="${DEPEND}"

DOCS=( README.md doc/documentation.md )

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/camlistore/go4" \
		"go4.org"
}
