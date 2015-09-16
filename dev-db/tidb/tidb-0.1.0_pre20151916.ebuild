# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/pingcap"
GOLANG_PKG_VERSION="ccaa36eedd0617cf3c48fba575f3e86a63c091ce"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_DEPEND_ON_GO_SUBSLOT=yes

inherit golang-single

DESCRIPTION="TiDB is a distributed SQL database compatible with MySQL protocol"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="sys-apps/coreutils
	dev-util/goyacc
	dev-util/golex"

src_prepare() {
	golang-single_src_prepare

	# generate lexer/parser
	local TMPFILE="$( mktemp temp.XXXXXX )"
	goyacc -o /dev/null -xegen ${TMPFILE} parser/parser.y || die
	goyacc -o parser/parser.go -xe ${TMPFILE} parser/parser.y || die
	golex -o parser/scanner.go parser/scanner.l || die
}
