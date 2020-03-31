# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/SpectoLabs"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/core/cmd/hoverfly"
GOLANG_PKG_LDFLAGS="-X main.hoverctlVersion=${PV} -X main.hoverflyVersion=${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Hoverfly is a lightweight, open source service virtualization tool."
HOMEPAGE="http://hoverfly.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE="+cli"
src_compile(){
	golang-single_src_compile

	# build hoverctl
	if use cli; then
		GOLANG_PKG_BUILDPATH="/hoverctl"
		golang-single_src_compile
	fi
}
