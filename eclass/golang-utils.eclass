# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# @ECLASS: golang-utils.eclass
# @MAINTAINER:
# Mauro Toffanin <toffanin.mauro@gmail.com>
# @AUTHOR:
# Mauro Toffanin <toffanin.mauro@gmail.com>
# @BLURB: Base eclass for GoLang packages
# @DESCRIPTION:
# This eclass provides functionalities which are used by golang-single.eclass,
# as well as from ebuilds.
#
# This eclass should not be inherited directly from an ebuild.
# Instead, you should inherit golang-single for GoLang packages.

if [[ -z ${_GOLANG_UTILS_ECLASS} ]]; then
_GOLANG_UTILS_ECLASS=1


inherit versionator


# @FUNCTION: golang_do_build
# @INTERNAL
# @USAGE: <flags> <buildpath>
# @DESCRIPTION:
#
# @CODE
# Example:
#   GOLANG_PKG_LDFLAGS="-extldflags=-static"
#   GOLANG_PKG_TAGS="netgo"
#
#	golang_do_build ${EGO_BUILD_FLAGS} ${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}${GOLANG_PKG_BUILDPATH}
# @CODE
golang_do_build() {
	debug-print-function ${FUNCNAME} $*

	[[ ${GOLANG_VERSION} ]] || die "No GoLang implementation set (golang_setup not called?)."

	# Filters "=" chars from ldflags declaration
	# NOTE: from go1.5+ linker syntax is no more compatible with <go1.4; this hack
	#       ensures that the old behaviour is honoured.
	if [[ $( get_version_component_range 1-2 ${GOLANG_VERSION} ) == "1.4" ]]; then
		GOLANG_PKG_LDFLAGS="${GOLANG_PKG_LDFLAGS//=/ }"
	fi

	einfo "${EGO} build -ldflags '$GOLANG_PKG_LDFLAGS' -tags '$GOLANG_PKG_TAGS' $*"
	${EGO} build \
		-ldflags "-s -w $( echo ${GOLANG_PKG_LDFLAGS} )" \
		-tags "$( echo ${GOLANG_PKG_TAGS} )" \
		$* \
		|| die
}


# @FUNCTION: golang_add_vendor
# @INTERNAL
# @USAGE: <path>
# @DESCRIPTION:
#
# @CODE
# Example
#
#   golang_add_vendor "${S}"/vendor
#   golang_add_vendor "${S}"/${PN}/vendor
# @CODE
golang_add_vendor() {
	debug-print-function ${FUNCNAME} $*

	[[ ${1} ]] || die "${FUNCNAME}: no paths given"

	[[ ${GOLANG_VERSION} ]] || die "No Golang implementation set (golang_setup not called?)."

	case $( get_version_component_range 1-2 ${GOLANG_VERSION} ) in
		1.4*)
			# TODO: traverse $1 and expose all the bundled /vendor
			#       sub-directories to GOLANG_PKG_VENDOR
			if [[ ! -d "${1}"/src ]]; then
				ebegin "Fixing $1"
					ln -s "${1}" "${1}"/src || die
				eend
			fi

			GOLANG_PKG_VENDOR+=" ${1}"
			;;
		1.5*)
			export GO15VENDOREXPERIMENT=1
			;;
	esac
}


# @FUNCTION: golang_fix_importpath_alias
# @USAGE: <target> <alias>
# @DESCRIPTION:
# Helper functions for generating a symbolic link for import path <target> as
# <alias>.
#
# WARNING: Use this function only if GOLANG_PKG_DEPENDENCIES declaration of
# import path aliases doesn't work (e.g.: the package name differs from both the
# import path and the alias, or if the package name is case sensitive but the
# import path is not).
#
# @CODE
# Example:
#
#   src_prepare() {
#   	golang-single_src_prepare
#
#   	golang_fix_importpath_alias \
#   		"github.com/GoogleCloudPlatform/gcloud-golang" \
#   		"google.golang.org/cloud"
#   }
# @CODE
golang_fix_importpath_alias() {
	debug-print-function ${FUNCNAME} "${@}"

	[[ ${1} ]] || die "${FUNCNAME}: no paths given"

	[[ ${EGO} ]] || die "No GoLang implementation set (golang_setup not called?)."


	local TARGET="${1}"
	local ALIAS="${2}"

	if [[ ${ALIAS%/*} != ${ALIAS} ]]; then
		mkdir -p "${GOPATH}/src/${ALIAS%/*}" || die
	fi
	ebegin "Linking ${TARGET} as ${ALIAS}"
		ln -s "${GOPATH}/src/${TARGET}" \
			"${GOPATH}/src/${ALIAS}" \
			|| die
	eend
}


fi
