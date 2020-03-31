# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/Luxurioust"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/BurntSushi/toml:bbd5bb6" #v0.2.0
	"github.com/rakyll/statik:274df12"   #v0.1.0
)

inherit golang-single

DESCRIPTION="Cross-platform Beanstalk queue server console"
HOMEPAGE="https://xuri.me/aurora"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="app-misc/beanstalkd"
RESTRICT+=" test"

src_install() {
	golang-single_src_install
	dodoc ${PN}.toml
}
