# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/msoap"
GOLANG_PKG_DEPENDENCIES=(
	"github.com/mgutz/ansi:9520e82c47"
	"github.com/mattn/go-colorable:efa589957c"
	"github.com/mattn/go-isatty:0360b2af4f"
	"github.com/msoap/html2data:d08eee1f5e"
)

inherit golang-single

DESCRIPTION="Command line interface for Yandex weather service"
HOMEPAGE="https://github.com/msoap/yandex-weather-cli"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~arm"
SLOT="0"

src_install() {
	doman yandex-weather-cli.1
	golang-common_src_install
}
