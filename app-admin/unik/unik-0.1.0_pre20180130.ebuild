# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/solo-io"
GOLANG_PKG_VERSION="56aac9e7cb6bd4bc3bdceeeaee87ea863793bf46"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:892bf7b -> golang.org/x"
)

inherit golang-single

DESCRIPTION="The Unikernel Compilation and Deployment Platform"
HOMEPAGE="https://www.solo.io  https://github.com/solo-io/unik"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm"

DEPEND="dev-go/go-bindata"
RDEPEND="app-emulation/docker"

src_prepare() {
	golang-single_src_prepare
	rm -r vendor/golang.org/x/net/ || die
}

src_install() {
	golang-single_src_install
	rm -r docs/examples || die
	dodoc -r docs/*
}

src_compile() {
	ebegin "Bulding bindata"
		go-bindata -pkg versiondata -o containers/container-versions.go containers/versions.json || die
		emake instance-listener/bindata/instance_listener_data.go || die
	eend
	golang-single_src_compile
}
