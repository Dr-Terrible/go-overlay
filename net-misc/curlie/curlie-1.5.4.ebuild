# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/rs"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/akamensky/argparse:99676ba"
	"github.com/jessevdk/go-flags:c6ca198"  #v1.4.0

	"github.com/golang/crypto:159ae71 -> golang.org/x"
	"github.com/golang/sys:3135538 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="The power of curl, the ease of use of HTTPie"
HOMEPAGE="https://curlie.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="net-misc/curl"
