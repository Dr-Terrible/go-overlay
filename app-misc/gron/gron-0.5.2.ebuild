# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/tomnomnom"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fatih/color:507f605"
	"github.com/nwidger/jsoncolor:75a6de4"
	"github.com/pkg/errors:816c908"
)

inherit golang-single

DESCRIPTION="Make JSON greppable!"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
