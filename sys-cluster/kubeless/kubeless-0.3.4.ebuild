# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/kubeless"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Kubernetes Native Serverless Framework"

EBUILD_COMMIT="d16de3f"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_prepare() {
	golang-single_src_prepare

	# Fix no git commit
	sed -i \
		-e "s#\$(git rev-parse --short HEAD)#${EBUILD_COMMIT}#" \
		script/binary || die
}

src_compile() {
	# Cannot use golang-single_src_compile otherwise we need to handle version
	#golang-single_src_compile

	make VERSION=${PV} binary
}

src_install() {
	# install the app
	golang-single_src_install
}
