# Copyright 1999-2021 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/DiSiqueira"
GOLANG_PKG_NAME="${PN//gor/Gor}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/go-ini/ini:5e97220 -> gopkg.in/ini.v1" #v1.62.0
	"github.com/disiqueira/GoTree:2e9f37e" #v3.0.2
)

inherit golang-single

DESCRIPTION="Organize your folders into a beautiful classified folder structure"
HOMEPAGE="https://disiqueira.github.io/Gorganizer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/disiqueira/GoTree" \
		"github.com/disiqueira/gotree"
}
