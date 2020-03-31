# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/constabulary"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="Gb is a project based build tool for the Go programming language"
HOMEPAGE="http://getgb.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RESTRICT+=" test"
