# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/pquerna"
GOLANG_PKG_VERSION="9d7075fb37d35c5b005b4cd3bdd1074e345a5d4e"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	# Unit Testing
	"github.com/google/gofuzz:fd52762"
	"github.com/stretchr/testify:f390dcf" #1.1.3
)

inherit golang-single

DESCRIPTION="Ffjson is a faster JSON serialization for Go"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="!dev-util/ffjson"

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
