# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/DiSiqueira"
GOLANG_PKG_NAME="${PN//gor/Gor}"
GOLANG_PKG_VERSION="fae9e0405d8b9a99f30fa01f6fa3ef88dd5132fa"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/boltdb/bolt:583e893" #v1.3.0
)

inherit golang-single

DESCRIPTION="Organize your folders into a beautiful classified folder structure"
HOMEPAGE="https://disiqueira.github.io/Gorganizer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
