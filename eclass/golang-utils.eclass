# Copyright 1999-2015 Gentoo Foundation
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

inherit versionator


# @FUNCTION: golang-single_do_build_
# @INTERNAL
# @USAGE: <flags> <buildpath>
# @DESCRIPTION:
#
# @CODE
# Example:
#   GOLANG_PKG_LDFLAGS="-extldflags=-static"
#   GOLANG_PKG_TAGS="netgo"
#
#	golang-single_do_build_ ${EGO_BUILD_FLAGS} ${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}${GOLANG_PKG_BUILDPATH}
# @CODE
golang-single_do_build_() {
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
		-ldflags "$( echo ${GOLANG_PKG_LDFLAGS} )" \
		-tags "$( echo ${GOLANG_PKG_TAGS} )" \
		$* \
		|| die
}