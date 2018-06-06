# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/jwilder"
GOLANG_PKG_BUILDPATH="/cmd/docker-gen"
GOLANG_PKG_LDFLAGS="-X main.buildVersion=${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit user golang-single

DESCRIPTION="Generate files from docker container meta-data"
HOMEPAGE="https://github.com/jwilder/docker-gen"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_compile() {
	export PATH="$GOBIN:$PATH"
	emake get-deps || die
	rm "${GOBIN}"/glock || die

	golang-single_src_compile
}
