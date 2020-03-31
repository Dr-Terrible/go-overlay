# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/gogo"
GOLANG_PKG_NAME="${PN//gogo-}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/proto /gogoproto /jsonpb /protoc-gen-gogo /protoc-gen-gofast /protoc-gen-gogofaster /protoc-gen-gogoslick /protoc-min-version /protoc-gen-combo"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Protocol Buffers for Go with Gadgets"
HOMEPAGE="http://gogo.github.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/protobuf:0=
	dev-go/go-protobuf"

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

	# Removes binaries which are not installable
	rm	"${ED}"/usr/bin/jsonpb \
		"${ED}"/usr/bin/proto \
		|| die
}
