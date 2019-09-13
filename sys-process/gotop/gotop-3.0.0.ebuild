# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/cjbassi"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A terminal based graphical activity monitor inspired by gtop and vtop"
HOMEPAGE="https://github.com/cjbassi/gotop"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

