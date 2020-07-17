# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/jessfraz"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH}/${PN}/version.GITCOMMIT=85eae5c -X ${GOLANG_PKG_IMPORTPATH}/${PN}/version.VERSION=${PV}"
GOLANG_PKG_TAGS="netgo"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Local File-Based Password, API Key, Secret, Recovery Code Store Backed vy GPG"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="static"

RDEPEND="|| ( x11-misc/xsel x11-misc/xclip )"

pkg_setup() {
	use static && GOLANG_PKG_LDFLAGS+=" -extldflags -static"
	use static && GOLANG_PKG_TAGS+=" static_build"
}

src_test() {
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
