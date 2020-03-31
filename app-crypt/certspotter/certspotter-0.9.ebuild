# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/SSLMate"
GOLANG_PKG_IMPORTPATH_ALIAS="software.sslmate.com/src"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mreiferson/go-httpclient:31f0106"
	"github.com/golang/text:f21a4df -> golang.org/x" #v0.3.0
	"github.com/golang/net:61147c4 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Certificate Transparency Log Monitor"
HOMEPAGE="https://sslmate.com/certspotter https://github.com/SSLMate/certspotter"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_test() {
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
