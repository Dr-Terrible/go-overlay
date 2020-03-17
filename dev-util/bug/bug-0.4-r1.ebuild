# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/driusan"
GOLANG_PKG_ARCHIVEPREFIX="v"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/blang/semver:2ee8785" #v3.5.1
)

inherit golang-single

DESCRIPTION="Distributed bug tracking with the filesystem and hg or git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"

RESTRICT+=" test"
