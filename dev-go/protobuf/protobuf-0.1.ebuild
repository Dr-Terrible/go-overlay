# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/gogo"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/proto /gogoproto /jsonpb /protoc-gen-gogo /protoc-gen-gofast /protoc-gen-gogofaster /protoc-gen-gogoslick /fieldpath/fieldpath-gen /fieldpath /pbpath /protoc-gen-gogo/version/protoc-min-version /protoc-gen-gogo/protoc-gen-combo"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Protocol Buffers for Go with Gadgets"
HOMEPAGE="http://gogo.github.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="dev-libs/protobuf:0/9"

src_compile() {
	# First pass
	golang-single_src_compile

	# Regenerate source code
	export PATH="$GOBIN:$PATH"
	emake -j1 regenerate || die
	rm "${GOBIN}"/* || die

	# Second pass
	golang-single_src_compile

	# Build enumprefix
	if use test; then
		local EGO_BUILD_FLAGS="-p $(makeopts_jobs)"

		einfo "${EGO} build -v -a -x $EGO_BUILD_FLAGS"
		${EGO} build ./test/enumprefix || die
	fi

}

src_install() {
	golang-single_src_install

	rm  "${ED}"/usr/bin/fieldpath \
		"${ED}"/usr/bin/gogoproto \
		"${ED}"/usr/bin/jsonpb \
		"${ED}"/usr/bin/proto \
		|| die
}