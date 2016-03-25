# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# @ECLASS: golang-live.eclass
# @MAINTAINER:
# Mauro Toffanin <toffanin.mauro@gmail.com>
# @AUTHOR:
# Mauro Toffanin <toffanin.mauro@gmail.com>
# @BLURB: Eclass for fetching and unpacking HEAD shapshot of go repositories
# @DESCRIPTION:
# This eclass is written to ease the maintenance of live ebuilds
# of software written in the Go programming language.

inherit golang-base

EXPORT_FUNCTIONS src_prepare src_unpack src_configure src_compile src_install src_test

if [[ -z ${_GOLANG_LIVE_ECLASS} ]]; then
_GOLANG_LIVE_ECLASS=1


# Validates use of GOLANG_PKG_DEPENDENCIES.
# NOTE: a live ebuild should not have go dependencies.
# TODO: check also if GOLANG_PKG_DEPENDENCIES is an array
if [[ -n ${GOLANG_PKG_DEPENDENCIES} ]]; then
	eerror "Ebuild ${CATEGORY}/${PF} specifies GOLANG_PKG_DEPENDENCIES."
	eerror "Please, fix it by removing GOLANG_PKG_DEPENDENCIES entirely."
	die "Banned variable GOLANG_PKG_DEPENDENCIES is set"
fi

# @FUNCTION: golang-live_src_unpack
# @DESCRIPTION:
# Unpack the source archive.
golang-live_src_unpack() {
	debug-print-function ${FUNCNAME} "$@"

	# Creates EGO_LIVESTORE_DIR if necessary.
	local distdir=${PORTAGE_ACTUAL_DISTDIR:-${DISTDIR}}
	local EGO_LIVESTORE_DIR=${EGO_LIVESTORE_DIR:=${distdir}/go-${PN}-livesrc}

	if [[ ! -d ${EGO_LIVESTORE_DIR} ]]; then
		(
			addwrite /
			mkdir -p "${EGO_LIVESTORE_DIR}"
		) || die "${ECLASS}: unable to create ${EGO_LIVESTORE_DIR}"
	fi

	addwrite "${EGO_LIVESTORE_DIR}"

	# Retrieves the GOLANG_PKG_IMPORTPATH go package along with its dependencies.
	set -- env GOPATH="${EGO_LIVESTORE_DIR}" go get -d -u -v -t -tags="${GOLANG_PKG_TAGS}" "${GOLANG_PKG_IMPORTPATH}/${GOLANG_PKG_NAME}"
	echo "$@"
	"$@" || die

	# Creates SOURCE directory.
	mkdir -p "${S}" || die
}


# @FUNCTION: golang-live_src_prepare
# @DESCRIPTION:
# Prepare source code.
golang-live_src_prepare() {
	debug-print-function ${FUNCNAME} "${@}"

	# Sets up GoLang build environment.
	golang_setup

	# Imports all go dependencies
	ebegin "Importing all the sources in ${GOPATH}"
		cp -r "${EGO_LIVESTORE_DIR}/src" "${GOPATH}" || die "Unable to copy sources to ${GOPATH}"
	eend

	golang-base_src_prepare
}


# @FUNCTION: golang-live_src_configure
# @DESCRIPTION:
# Configure the package.
golang-live_src_configure() {
	debug-print-function ${FUNCNAME} "$@"

	golang-base_src_configure
}

# @FUNCTION: golang-live_src_compile
# @DESCRIPTION:
# Compiles the package.
golang-live_src_compile() {
	debug-print-function ${FUNCNAME} "$@"

	golang-base_src_compile
}

# @FUNCTION: golang-live_src_install
# @DESCRIPTION:
# Installs binaries and documents from DOCS or HTML_DOCS arrays.
golang-live_src_install() {
	debug-print-function ${FUNCNAME} "$@"

	golang-base_src_install
}

# @FUNCTION: golang-live_src_test
# @DESCRIPTION:
# Runs the unit tests for the main package.
golang-live_src_test() {
	debug-print-function ${FUNCNAME} "$@"

	golang-base_src_test
}


fi
