# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/pingcap"
GOLANG_PKG_VERSION="27764555668419dee3ce9ad2a7c48fc2685369a7"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="TiDB is a distributed SQL database compatible with MySQL protocol"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="sys-apps/coreutils"

GOLANG_PKG_VENDOR=(
	"${S}/_vendor"
)

src_compile() {
	# Build YACC parser
	GOLANG_PKG_OUTPUT_NAME="goyacc"
	GOLANG_PKG_BUILDPATH="/parser/goyacc"
	golang-single_src_compile
	emake parser || die
	rm "${GOBIN}/${GOLANG_PKG_OUTPUT_NAME}" || die

	# Build TiDB Server
	GOLANG_PKG_OUTPUT_NAME="${PN}-server"
	GOLANG_PKG_BUILDPATH="/${GOLANG_PKG_OUTPUTNAME}"
	golang-single_src_compile
}
