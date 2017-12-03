# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/alexkohler"
GOLANG_PKG_VERSION="c0e305a4f690fed163d47628bcc06a6d5655bf92"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="a Go static analysis tool to find naked returns in functions"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
