# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/ajanicij"
GOLANG_PKG_VERSION="61f9a275272fdda937276765b8bc69f5e2310a8f"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Command-line tool for DuckDuckGo API"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
