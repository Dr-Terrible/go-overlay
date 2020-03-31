# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/olebedev"
GOLANG_PKG_NAME="go-${PN}"
GOLANG_PKG_VERSION="956dbdf427ebe572ff25ad9ed9f9c851d3e46126"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(

	# unit testing
	"github.com/go-check/check:20d25e2 -> gopkg.in/check.v1"
)

inherit golang-single

DESCRIPTION="CLI for Duktape JavaScript engine written in GoLang"
HOMEPAGE="http://duktape.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/olebedev/go-${PN}" \
		"gopkg.in/olebedev/go-${PN}.v2"
}
