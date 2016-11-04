# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/golang"
GOLANG_PKG_IMPORTPATH_ALIAS="golang.org/x"
GOLANG_PKG_NAME="${PN/go-}"
GOLANG_PKG_VERSION="c74ac01963d19af894026dbcfb7f421906a57d8f"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/net:569280f -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Various packages and tools that support the Go programming language"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="!<dev-lang/go-1.6.0"

src_compile() {
	# Generate static.go
	pushd godoc/static >/dev/null
		ebegin "Building static files"
			${EGO} run \
				-a -p $( makeopts_jobs ) \
				makestatic.go || die
		eend
	popd >/dev/null

	golang-single_src_compile
}

src_install() {
	golang-single_src_install

	# install binaries in $GOROOT/bin to avoid file collisions
	exeinto "$(go env GOROOT)/bin"
	doexe "${GOBIN}"/*
	rm "${ED}"usr/bin/* || die
	dosym "${ED}$( go env GOROOT )/bin/godoc" /usr/bin/godoc

	# install static files for the 'present' tool
	local EIMPORTPATH="${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}"
	local EGOROOT="${ED}$( go env GOROOT )/src/${EIMPORTPATH}/cmd/present"
	mkdir -p ${EGOROOT} || die
	cp -pR "${GOPATH}"/src/${EIMPORTPATH}/cmd/present/{static,templates} "${EGOROOT}" || die
}
