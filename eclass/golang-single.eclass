# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# @ECLASS: golang-single.eclass
# @MAINTAINER:
# Mauro Toffanin <toffanin.mauro@gmail.com>
# @AUTHOR:
# Mauro Toffanin <toffanin.mauro@gmail.com>
# @BLURB: An eclass for GoLang packages not installed inside GOPATH/GOBIN.
# @DESCRIPTION:
# This eclass allows to install arbitrary packages written in GoLang which
# don't support being installed inside the Go environment.
# This mostly includes traditional packages (C/C++/GUI) embedding tools written
# in GoLang, and GoLang packages that need to be compiled with GCC instead of
# the standard Go interpreter.
#
# @EXAMPLE:
# Typical ebuild using golang-single.eclass:
#
# @CODE
# EAPI=5
#
# GOLANG_PKG_IMPORTPATH="github.com/captObvious"
# GOLANG_PKG_SUFFIX=".zip"
# GOLANG_PKG_HAVE_TEST
# inherit golang-single qt4-r2
#
# DESCRIPTION="Foo bar application"
# HOMEPAGE="http://example.org/foo/"
#
# LICENSE="MIT"
# KEYWORDS="~amd64 ~x86"
# SLOT="0"
# IUSE="debug doc qt4"
#
# CDEPEND="
#   qt4? (
#       dev-qt/qtcore:4
#       dev-qt/qtgui:4
#   )"
# RDEPEND="${CDEPEND}
#   !media-gfx/bar"
# DEPEND="${CDEPEND}
#   doc? ( app-doc/doxygen )"
#
# DOCS=(AUTHORS ChangeLog README "Read me.txt" TODO)
#
# PATCHES=(
#   "${FILESDIR}/${P}-qt4.patch" # bug 123458
#   "${FILESDIR}/${P}-as-needed.patch"
# )
#
# src_install() {
#   use doc && HTML_DOCS=("${BUILD_DIR}/apidocs/html/")
#   autotools-utils_src_install
#   if use examples; then
#       dobin "${BUILD_DIR}"/foo_example{1,2,3} \\
#           || die 'dobin examples failed'
#   fi
# }
#
# @CODE


inherit base multiprocessing

RESTRICT+="mirror"

QA_FLAGS_IGNORED="usr/bin/.*
	usr/sbin/.*"

EXPORT_FUNCTIONS pkg_setup src_unpack src_configure src_compile src_install src_test

# @ECLASS-VARIABLE: GOLANG_PKG_DEPEND_ON_GO_SUBSLOT
# @DESCRIPTION:
# Set to ensure the package does depend on the dev-lang/go subslot value.
# Possible values: {yes,no}
GOLANG_PKG_DEPEND_ON_GO_SUBSLOT=${GOLANG_PKG_DEPEND_ON_GO_SUBSLOT:="no"}


# Silence repoman warnings
case "${EAPI:-0}" in
	5)
		case "${GOLANG_PKG_DEPEND_ON_GO_SUBSLOT:-yes}" in
			yes)
				GO_DEPEND="dev-lang/go:0="
				;;
			*)
				GO_DEPEND="dev-lang/go:*"
				;;
		esac
		;;
	*)
		die "EAPI=${EAPI} is not supported by golang-single.eclass"
		;;
esac
DEPEND+=" ${GO_DEPEND}"

# @ECLASS-VARIABLE: GOLANG_PKG_NAME
# @DESCRIPTION:
# Sets the GoLang name for the generated package.
# GOLANG_PKG_NAME="${PN}"
GOLANG_PKG_NAME="${GOLANG_PKG_NAME:-${PN}}"

# @ECLASS-VARIABLE: GOLANG_PKG_VERSION
# @DESCRIPTION:
# Sets the GoLang version for the generated package.
# GOLANG_PKG_VERSION="${PV}"
GOLANG_PKG_VERSION="${GOLANG_PKG_VERSION:-${PV/_pre/.pre}}"

# @ECLASS-VARIABLE: GOLANG_PKG_IMPORTPATH
# @DESCRIPTION:
# Sets the remote import path for the generated package.
# GOLANG_PKG_IMPORTPATH="github.com/captObvious/"
GOLANG_PKG_IMPORTPATH="${GOLANG_PKG_IMPORTPATH:-}"

# @ECLASS-VARIABLE: GOLANG_PKG_IMPORTPATH_ALIAS
# @DESCRIPTION:
# Sets an alias of the remote import path for the generated package.
# GOLANG_PKG_IMPORTPATH_ALIAS="privaterepo.com/captObvious/"
GOLANG_PKG_IMPORTPATH_ALIAS="${GOLANG_PKG_IMPORTPATH_ALIAS:="${GOLANG_PKG_IMPORTPATH}"}"

# @ECLASS-VARIABLE: GOLANG_PKG_PREFIX
# @DESCRIPTION:
# Sets the archive prefix for the file URI of the package.
# Most projects hosted on GitHub's mirrors provide archives with prefix as
# 'v' or 'source-', other hosted services offer different archive formats.
# This eclass defaults to an empty prefix.
GOLANG_PKG_PREFIX="${GOLANG_PKG_PREFIX:-}"

# @ECLASS-VARIABLE: GOLANG_PKG_SUFFIX
# @DESCRIPTION:
# Sets the archive suffix for the file URI of the package.
# Most projects hosted on GitHub's mirrors provide archives with suffix as
# '.tar.gz' or '.zip', other hosted services offer different archive formats.
# This eclass defaults to '.tar.gz'.
GOLANG_PKG_SUFFIX="${GOLANG_PKG_SUFFIX:=".tar.gz"}"

# @ECLASS-VARIABLE: GOLANG_PKG_OUTPUT_NAME
# @DESCRIPTION:
# Specifies the output file name of the package. If not set, it derives from the
# name of the package, such as $GOLANG_PKG_NAME.
# This eclass defaults to $PN.
GOLANG_PKG_OUTPUT_NAME="${GOLANG_PKG_OUTPUT_NAME:="${GOLANG_PKG_NAME}"}"

# @ECLASS-VARIABLE: GOLANG_PKG_BUILDPATH
# @DESCRIPTION:
# TODO
GOLANG_PKG_BUILDPATH="${GOLANG_PKG_BUILDPATH:-}"

# @ECLASS-VARIABLE: GOLANG_PKG_INSTALLPATH
# @DESCRIPTION:
# TODO
GOLANG_PKG_INSTALLPATH="${GOLANG_PKG_INSTALLPATH:="/usr"}"

# @ECLASS-VARIABLE: GOLANG_PKG_MULTIPLE
# @DESCRIPTION:
# Set to enable the building of multiple packages.

# @ECLASS-VARIABLE: GOLANG_PKG_HAVE_TEST
# @DEFAULT_UNSET
# @DESCRIPTION:
# Set to enable the execution of automated testing.

# @ECLASS-VARIABLE: GO
# @DEFAULT_UNSET
# @DESCRIPTION:
# The absolute path to the current GoLang interpreter.
#
# This variable is set automatically after calling golang-single_pkg_setup().
#
# Default value:
# @CODE
# /usr/bin/go
# @CODE

# @ECLASS-VARIABLE: EGO
# @DEFAULT_UNSET
# @DESCRIPTION:
# The executable name of the current GoLang interpreter.
#
# This variable is set automatically after calling golang-single_pkg_setup().
#
# Default value:
# @CODE
# go
# @CODE


if [[ -z ${GOLANG_PKG_IMPORTPATH} ]]; then
	eerror "The remote import path for this package has not been declared"
	die "Mandatary variable GOLANG_PKG_IMPORTPATH is unset"
fi

# Even though xz-utils are in @system, they must still be added to DEPEND; see
# http://archives.gentoo.org/gentoo-dev/msg_a0d4833eb314d1be5d5802a3b710e0a4.xml
if [[ ${GOLANG_PKG_SUFFIX/.*} == "xz" ]]; then
	DEPEND+=" app-arch/xz-utils"
fi

if [[ -n ${GOLANG_PKG_HAVE_TEST} ]]; then
	IUSE+=" test"
fi

# We use GOLANG_PKG_IMPORTPATH to populate SRC_URI
SRC_URI="https://${GOLANG_PKG_IMPORTPATH}/${GOLANG_PKG_NAME}/archive/${GOLANG_PKG_PREFIX}${GOLANG_PKG_VERSION}${GOLANG_PKG_SUFFIX} -> ${P}${GOLANG_PKG_SUFFIX}"

# We use GOLANG_PKG_IMPORTPATH associative array to populate SRC_URI with
# the snapshots of the required GoLang dependencies
if [[ ${#GOLANG_PKG_DEPENDENCIES[@]} -gt 0 ]]; then

	for module in ${!GOLANG_PKG_DEPENDENCIES[@]} ; do

		# Strip all the white spaces
		local DEPENDENCY="${GOLANG_PKG_DEPENDENCIES[$module]//\ /}"

		# Strip the alias
		DEPENDENCY="${DEPENDENCY%%->*}"

		# Determine the import path and revision tag
		local _importpath="${DEPENDENCY%:*}"
		local _revision="${DEPENDENCY#*:}"

		debug-print "${FUNCNAME}: DEPENDENCY = {DEPENDENCY}"
		debug-print "${FUNCNAME}: importpath = ${_importpath}"
		debug-print "${FUNCNAME}: revision = ${_revision}"

		# Download the archive
		case ${_importpath} in
			github*)
				SRC_URI+=" https://${_importpath}/archive/${_revision}${GOLANG_PKG_SUFFIX} -> ${_importpath//\//-}-${_revision}${GOLANG_PKG_SUFFIX}"
				;;
			bitbucket*)
				SRC_URI+=" https://${_importpath}/get/${_revision}.zip -> ${_importpath//\//-}-${_revision}.zip"
				;;
			*) die "this eclass doesn't support ${_importpath}" ;;
		esac

	done
fi


# Define SOURCE directory
S="${WORKDIR}/gopath/src/${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}"


# @FUNCTION: golang-single_pkg_setup
# @DESCRIPTION:
# Runs pkg_setup.
# Determine where is the GoLang implementation and set GoLang build environment.
golang-single_pkg_setup() {
	debug-print-function ${FUNCNAME} "${@}"

	# Keep /usr/bin/go as index [0] and never overwrite it,
	# always append other binary paths after the index [0]
	local GOLANG_BINS=(
		/usr/bin/go
		/usr/bin/gofmt
	)

	unset EGO

	# Determine is the GoLang interpreter is working
	local IS_EXECUTABLE=1
	for binary in "${GOLANG_BINS[@]}"; do
		debug-print "${FUNCNAME}: Checking ... ${binary}"

		[[ -x "${EPREFIX}/${binary}" ]] && continue
		IS_EXECUTABLE=0
		ewarn "It seems that the binary '${binary}' is not executable."
	done

	# dev-lang/go isn't installed or one of its binaries aren't executable.
	# Either way, the Gentoo box is screwed; no need to set up the GoLang environment
	[[ ${IS_EXECUTABLE} == 0 ]] && exit

	# dev-lang/go is available and working.
	# Exports EGO/GO global variables
	export GO="${GOLANG_BINS[0]}"
	debug-print "${FUNCNAME}: GO = ${GO}"
	export EGO="$( basename ${GOLANG_BINS[0]} )"
	debug-print "${FUNCNAME}: EGO = ${EGO}"

	# Determines go interpreter version
	local GOLANG_VERSION="$( ${GO} version )"
	GOLANG_VERSION="${GOLANG_VERSION/go\ version\ go}"
	GOLANG_VERSION="${GOLANG_VERSION%\ *}"
	einfo "Found GoLang version: ${GOLANG_VERSION}"

	# Sets the build environment inside Portage's WORKDIR
	ebegin "Setting up GoLang build environment"

		export GOPATH="${WORKDIR}/gopath"
		export GOBIN="${WORKDIR}/gobin"
		export EGO_SRC="${GOPATH}/src"

		mkdir -p "${GOBIN}" || die
		mkdir -p "${GOPATH}"/src || die

		debug-print "${FUNCNAME}: GOPATH = ${GOPATH}"
		debug-print "${FUNCNAME}: GOBIN = ${GOBIN}"
		debug-print "${FUNCNAME}: EGO_SRC = ${EGO_SRC}"
	eend
}


# @FUNCTION: golang-single_src_unpack
# @DESCRIPTION:
# Unpack the source archive.
golang-single_src_unpack() {
	debug-print-function ${FUNCNAME} "${@}"

	base_src_unpack

	einfo "Preparing GoLang build environment in ${GOPATH}/src"

	# If the ebuild declares some GoLang dependencies, then they need to be
	# correctly installed into the sand-boxed GoLang build environment which
	# was set up automatically during pkg_setup() phase
	if [[ ${#GOLANG_PKG_DEPENDENCIES[@]} -gt 0 ]]; then
		# move GoLang dependencies from WORKDIR into GOPATH
		for module in ${!GOLANG_PKG_DEPENDENCIES[@]} ; do

			# Strip all the white spaces
			local DEPENDENCY="${GOLANG_PKG_DEPENDENCIES[$module]//\ /}"

			# Determine the alias of the import path
			local _importpathalias="${DEPENDENCY##*->}"

			# Strip the alias
			DEPENDENCY="${DEPENDENCY%%->*}"

			# Factorize the import path in specific tokens such as the host name,
			# the author name, the project name, and the revision tag
			local _importpath="${DEPENDENCY%:*}"
			local _host="${_importpath%%/*}"
			local _project_name="${_importpath##*/}"
			local _author_name="${_importpath#*/}"
			_author_name="${_author_name%/*}"
			local _revision="${DEPENDENCY#*:}"

			# When the alias is not specified, then we set the alias as equal to
			# the import path minus the project name
			[[ $DEPENDENCY == $_importpathalias ]] && _importpathalias="${_importpath%/*}"


			debug-print "${FUNCNAME}: importpath      = ${_importpath}"
			debug-print "${FUNCNAME}: importpathalias = ${_importpathalias}"
			debug-print "${FUNCNAME}: host            = ${_host}"
			debug-print "${FUNCNAME}: author          = ${_author_name}"
			debug-print "${FUNCNAME}: project         = ${_project_name}"
			debug-print "${FUNCNAME}: revision        = ${_revision}"

			#einfo "importpath      = ${_importpath}"
			#einfo "importpathalias = ${_importpathalias}"
			#einfo "host            = ${_host}"
			#einfo "author          = ${_author_name}"
			#einfo "project         = ${_project_name}"
			#einfo "revision        = ${_revision}"


			# Create the import path in GOPATH
			mkdir -p "${GOPATH}"/src/${_importpathalias} || die
			#einfo "\n${GOPATH}/src/${_importpathalias}"

			# Unpack the archive and move sources from WORKDIR into GOPATH
			local _message="Moving ${_importpath}"
			[[ "${_importpath}" != "${_importpathalias}/${_project_name}" ]] && _message+=" as ${_importpathalias}/${_project_name}"
			case ${_host} in
				github*)
					ebegin "${_message}"
						mv ${_project_name}-${_revision}* "${GOPATH}"/src/${_importpathalias}/${_project_name} || die
					eend
					;;
				bitbucket*)
					#einfo "path: ${_author_name}-${_project_name}-${_revision}"
					ebegin "${_message}"
						mv ${_author_name}-${_project_name}-${_revision} "${GOPATH}"/src/${_importpathalias}/${_project_name} || die
					eend
					;;
				*) die "this eclass doesn't support ${_importpath}" ;;
			esac
		done
	fi

	# move GoLang main package from WORKDIR into GOPATH
	mkdir -p "${GOPATH}"/src/${GOLANG_PKG_IMPORTPATH_ALIAS} || die
	ebegin "Moving ${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}"
		mv "${GOLANG_PKG_NAME}-${GOLANG_PKG_VERSION}" "${GOPATH}"/src/${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME} || die
	eend
}

# @FUNCTION: golang-single_src_configure
# @DESCRIPTION:
# Configure the package.
golang-single_src_configure() {
	debug-print-function ${FUNCNAME} "${@}"

	[[ ${EGO} ]] || die "No GoLang implementation set (pkg_setup not called?)."

	# GoLang doesn't have a configure phase,
	# so instead we print the output of 'go env'
	oldifs="$IFS"
	IFS=$'\n'
	local -a GOLANG_ENV=( $( ${GO} env ) )
	IFS="$oldifs"
	if [[ ${#GOLANG_ENV[@]} -eq 1 ]]; then
		eerror "Your GoLang environment should be more verbose"
	fi

	# Prints build environment summary
	for env in "${GOLANG_ENV[@]}"; do
		einfo " - ${env}"
	done
}


# @FUNCTION: golang-single_src_compile
# @DESCRIPTION:
# Compiles the package.
golang-single_src_compile() {
	debug-print-function ${FUNCNAME} "${@}"

	[[ ${EGO} ]] || die "No GoLang implementation set (pkg_setup not called?)."

	# Define the output of the project name.
	# If the GoLang package is a multiple package then we don't specify the output
	local OUTPUT
	if [[ -z ${GOLANG_PKG_MULTIPLE} ]]; then
		OUTPUT="-o ${GOBIN}/${GOLANG_PKG_OUTPUT_NAME}"
	fi

	# Build the package
	${EGO} build \
		-v -a -p $(makeopts_jobs) \
		${OUTPUT} \
		${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}/${GOLANG_PKG_BUILDPATH} \
		|| die
}


# @FUNCTION: golang-single_src_install
# @DESCRIPTION:
# Installs binaries and documents from DOCS or HTML_DOCS arrays.
golang-single_src_install() {
	debug-print-function ${FUNCNAME} "${@}"

	# install binaries
	if [[ -z ${GOLANG_PKG_MULTIPLE} ]]; then
		into ${GOLANG_PKG_INSTALLPATH}
		dobin "${GOBIN}"/${GOLANG_PKG_OUTPUT_NAME}
	fi

	base_src_install_docs
}


# @FUNCTION: golang-single_src_test
# @DESCRIPTION:
# Runs the unit test for the main package.
golang-single_src_test() {
	debug-print-function ${FUNCNAME} "${@}"

	[[ ${EGO} ]] || die "No GoLang implementation set (pkg_setup not called?)."

	${EGO} test \
		-v -a -p $(makeopts_jobs) \
		-o "${GOBIN}"/${GOLANG_PKG_OUTPUT_NAME} \
		${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}/${GOLANG_PKG_BUILDPATH} \
		|| die
}