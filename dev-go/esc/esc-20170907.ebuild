# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_NAME="esc"
GOLANG_PKG_IMPORTPATH="github.com/mjibson"
GOLANG_PKG_VERSION="58d9cde84f237ecdd89bd7f61c2de2853f4c5c6e"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="A simple file embedder for Go"
HOMEPAGE="http://godoc.org/github.com/mjibson/esc"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
