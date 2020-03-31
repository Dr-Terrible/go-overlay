# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/coreos"
GOLANG_PKG_VERSION="${PV//_alpha/-alpha.}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH}/${PN}/version.Version=${PV//_alpha/-alpha}"
GOLANG_PKG_TAGS="libsqlite3"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Dex is a Federated Indentity Provider"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="icu"

RESTRICT+=" test"

DEPEND="!dev-go/dex
	dev-go/go-bindata"
RDEPEND="dev-db/sqlite:3[icu?]"

src_compile() {
	use icu && GOLANG_PKG_TAGS+=" icu"
	golang-single_src_compile
}

src_test() {
	if has sandbox $FEATURES && has usersandbox $FEATURES; then
		eerror "Tests require sandbox, and usersandbox to be disabled in FEATURES."
	fi

	local EGO_PARALLEL="-p $(makeopts_jobs)"
	local EGO_TESTABLE="connector db integration pkg/crypto pkg/flag pkg/http pkg/net pkg/time pkg/html functional/repo server session user/api "

	local split=(${EGO_TESTABLE// / })
	EGO_TESTABLE=${split[@]/#/./}
	local EGO_BUILD_FLAGS=" -v ${EGO_PARALLEL} -a ${EGO_TESTABLE}"

	einfo "${EGO} test ${EGO_BUILD_FLAGS}"
	${EGO} test ${EGO_BUILD_FLAGS} || die
}
