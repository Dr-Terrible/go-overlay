# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/pquerna"
GOLANG_PKG_VERSION="4a0805c1782dcdf59a133bd8c91810245d5eda4c"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/google/gofuzz:e4af62d"
	"github.com/stretchr/testify:232e856" #v1.0
)

inherit golang-single

DESCRIPTION="Ffjson is a faster JSON serialization for Go"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_test() {

	einfo "Generating tests ..."
		${GOBIN}/${PN} tests/ff.go || die
		${GOBIN}/${PN} tests/goser/ff/goser.go || die
		${GOBIN}/${PN} tests/go.stripe/ff/customer.go || die
		${GOBIN}/${PN} tests/types/ff/everything.go || die

	einfo "${EGO} test -v ${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}/tests/..."
		${EGO} test -v \
		"${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}/fflib/v1" \
		"${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}/generator" \
		"${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}/inception" \
		"${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}/tests/..." \
		|| die
}