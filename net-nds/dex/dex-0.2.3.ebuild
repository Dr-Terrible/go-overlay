# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/coreos"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}-worker /cmd/${PN}ctl /cmd/${PN}-overlord"
GOLANG_PKG_LDFLAGS="-X main.version=v${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Dex is a Federated Indentity Provider written in GoLang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="!dev-go/dex
	dev-go/go-bindata"

src_compile() {
	ebegin "Building binary data"
		go-bindata -debug=false -modtime=1 -pkg migrations -o ./db/migrations/assets.go ./db/migrations || die
	eend

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
