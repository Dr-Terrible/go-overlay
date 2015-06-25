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
# GOLANG_PKG_ARCHIVESUFFIX=".zip"
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

# @ECLASS-VARIABLE: GOLANG_PKG_ARCHIVEPREFIX
# @DESCRIPTION:
# Sets the archive prefix for the file URI of the package.
# Most projects hosted on GitHub's mirrors provide archives with prefix as
# 'v' or 'source-', other hosted services offer different archive formats.
# This eclass defaults to an empty prefix.
GOLANG_PKG_ARCHIVEPREFIX="${GOLANG_PKG_ARCHIVEPREFIX:-}"

# @ECLASS-VARIABLE: GOLANG_PKG_ARCHIVESUFFIX
# @DESCRIPTION:
# Sets the archive suffix for the file URI of the package.
# Most projects hosted on GitHub's mirrors provide archives with suffix as
# '.tar.gz' or '.zip', other hosted services offer different archive formats.
# This eclass defaults to '.tar.gz'.
GOLANG_PKG_ARCHIVESUFFIX="${GOLANG_PKG_ARCHIVESUFFIX:=".tar.gz"}"

# @ECLASS-VARIABLE: GOLANG_PKG_OUTPUT_NAME
# @DESCRIPTION:
# Specifies the output file name of the package.
# If not set, it derives from the name of the package, such as $GOLANG_PKG_NAME.
# This eclass defaults to $PN.
GOLANG_PKG_OUTPUT_NAME="${GOLANG_PKG_OUTPUT_NAME:="${GOLANG_PKG_NAME}"}"

# @ECLASS-VARIABLE: GOLANG_PKG_BUILDPATH
# @DESCRIPTION:
# TODO
# This eclass defaults to an empty build path.
GOLANG_PKG_BUILDPATH="${GOLANG_PKG_BUILDPATH:-}"

# @ECLASS-VARIABLE: GOLANG_PKG_INSTALLPATH
# @DESCRIPTION:
# TODO
# This eclass defaults to "/usr"
GOLANG_PKG_INSTALLPATH="${GOLANG_PKG_INSTALLPATH:="/usr"}"

# @ECLASS-VARIABLE: GOLANG_PKG_INSTALLSUFFIX
# @DESCRIPTION:
# TODO
# This eclass defaults to an empty install suffix.
GOLANG_PKG_INSTALLSUFFIX="${GOLANG_PKG_INSTALLSUFFIX:-}"

# @ECLASS-VARIABLE: GOLANG_PKG_IS_MULTIPLE
# @DESCRIPTION:
# Set to enable the building of multiple packages from a single import path.

# @ECLASS-VARIABLE: GOLANG_PKG_HAVE_TEST
# @DEFAULT_UNSET
# @DESCRIPTION:
# Set to enable the execution of automated testing.

# @ECLASS-VARIABLE: GOLANG_PKG_USE_CGO
# @DEFAULT_UNSET
# @DESCRIPTION:
# Set to enable the compilation of the package with CGO.

# @ECLASS-VARIABLE: GOLANG_PKG_DEPEND_ON_GO_SUBSLOT
# @DESCRIPTION:
# Set to ensure the package does depend on the dev-lang/go subslot value.
# Possible values: {yes,no}
# This eclass defaults to "no"
GOLANG_PKG_DEPEND_ON_GO_SUBSLOT=${GOLANG_PKG_DEPEND_ON_GO_SUBSLOT:="no"}

# @ECLASS-VARIABLE: GOLANG_PKG_LDFLAGS
# @DESCRIPTION:
# Sets the linker arguments to pass to 5l, 6l, or 8l.
# This eclass defaults to an empty list.
GOLANG_PKG_LDFLAGS="${GOLANG_PKG_LDFLAGS:-}"

# @ECLASS-VARIABLE: GOLANG_PKG_VENDOR
# @DESCRIPTION:
# Sets additional standard Go workspaces to be appended to the environment
# variable GOPATH, as described in http://golang.org/doc/code.html.
# This eclass defaults to an empty list.
GOLANG_PKG_VENDOR="${GOLANG_PKG_VENDOR:-}"


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


# Silences repoman warnings.
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

# Adds gccgo as a compile-time dependency when GOLANG_PKG_USE_CGO is set.
[[ -n ${GOLANG_PKG_USE_CGO} ]] && DEPEND+=" >=sys-devel/gcc-4.8.4[go]"


# Validates GOLANG_PKG_IMPORTPATH
if [[ -z ${GOLANG_PKG_IMPORTPATH} ]]; then
	eerror "The remote import path for this package has not been declared"
	die "Mandatary variable GOLANG_PKG_IMPORTPATH is unset"
fi

# Forces a multiple package build when user specifies GOLANG_PKG_IS_MULTIPLE=1
if [[ -n ${GOLANG_PKG_IS_MULTIPLE} && -z ${GOLANG_PKG_BUILDPATH} ]]; then
	GOLANG_PKG_BUILDPATH="/..."
fi

# Validates use of GOLANG_PKG_BUILDPATH combined with GOLANG_PKG_IS_MULTIPLE
# FIX: makes sure user isn't overriding GOLANG_PKG_BUILDPATH with inane values
if [[ -n ${GOLANG_PKG_IS_MULTIPLE} && ${GOLANG_PKG_BUILDPATH##*/} != "..." ]]; then
	ewarn "Ebuild ${CATEGORY}/${PF} specifies GOLANG_PKG_IS_MULTIPLE=1,"
	ewarn "but then GOLANG_PKG_BUILDPATH is overridden with \"${GOLANG_PKG_BUILDPATH}\"."
	ewarn "Please, fix it by appending \"/...\" to your GOLANG_PKG_BUILDPATH."
	ewarn "If in doubt, remove GOLANG_PKG_BUILDPATH entirely."
fi

# Even though xz-utils are in @system, they must still be added to DEPEND; see
# http://archives.gentoo.org/gentoo-dev/msg_a0d4833eb314d1be5d5802a3b710e0a4.xml
if [[ ${GOLANG_PKG_ARCHIVESUFFIX/.*} == "xz" ]]; then
	DEPEND+=" app-arch/xz-utils"
fi

if [[ -n ${GOLANG_PKG_HAVE_TEST} ]]; then
	IUSE+=" test"
fi

# We use GOLANG_PKG_IMPORTPATH to populate SRC_URI
SRC_URI="https://${GOLANG_PKG_IMPORTPATH}/${GOLANG_PKG_NAME}/archive/${GOLANG_PKG_ARCHIVEPREFIX}${GOLANG_PKG_VERSION}${GOLANG_PKG_ARCHIVESUFFIX} -> ${P}${GOLANG_PKG_ARCHIVESUFFIX}"

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
				SRC_URI+=" https://${_importpath}/archive/${_revision}${GOLANG_PKG_ARCHIVESUFFIX} -> ${_importpath//\//-}-${_revision}${GOLANG_PKG_ARCHIVESUFFIX}"
				;;
			bitbucket*)
				SRC_URI+=" https://${_importpath}/get/${_revision}.zip -> ${_importpath//\//-}-${_revision}.zip"
				;;
			*) die "this eclass doesn't support '${_importpath}'" ;;
		esac

	done
fi


# Define SOURCE directory
S="${WORKDIR}/gopath/src/${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}"


# @FUNCTION: golang-single_pkg_setup
# @DESCRIPTION:
# Runs pkg_setup.
# Determines where is the GoLang implementation and then set-up the
# GoLang build environment.
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
	export EGO="${GOLANG_BINS[0]##*/}"

	debug-print "${FUNCNAME}: GO = ${GO}"
	debug-print "${FUNCNAME}: EGO = ${EGO}"

	# Determines go interpreter version
	local GOLANG_VERSION="$( ${GO} version )"
	GOLANG_VERSION="${GOLANG_VERSION/go\ version\ go}"
	GOLANG_VERSION="${GOLANG_VERSION%\ *}"
	einfo "Found GoLang version: ${GOLANG_VERSION}"

	# Sets the build environment inside Portage's WORKDIR
	ebegin "Setting up GoLang build environment"

		# Prepares CGO_ENABLED
		CGO_ENABLED=0
		[[ -z ${GOLANG_PKG_USE_CGO} ]] || CGO_ENABLED=1

		# Prepares gopath / gobin directories inside WORKDIR
		local _GOPATH="${WORKDIR}/gopath"
		local _GOBIN="${WORKDIR}/gobin"
		mkdir -p "${_GOBIN}" || die
		mkdir -p "${_GOPATH}"/src || die

		# Exports special env variable EGO_SRC
		export EGO_SRC="${_GOPATH}/src"

		# Exports GoLang env variables
		export GOPATH="$_GOPATH"
		export GOBIN="$_GOBIN"
		export CGO_ENABLED

		debug-print "${FUNCNAME}: GOPATH = ${GOPATH}"
		debug-print "${FUNCNAME}: GOBIN = ${GOBIN}"
		debug-print "${FUNCNAME}: EGO_SRC = ${EGO_SRC}"
		debug-print "${FUNCNAME}: CGO_ENABLED = ${CGO_ENABLED}"
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
				*) die "this eclass doesn't support '${_importpath}'" ;;
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

	# Auto-detects the presence of Godep's workspace
	# (see github.com/tools/godep for more infos)
	[[ -d "${S}"/Godeps/_workspace/src ]] && GOLANG_PKG_VENDOR+="${S}/Godeps/_workspace"

	# Populates global env variable GOPATH
	if [[ -n ${GOLANG_PKG_VENDOR} ]]; then
		einfo "Using bundled packages from:"

		for x in "${GOLANG_PKG_VENDOR[@]}"; do
			[ -d ${x} ] || continue

			debug-print "$FUNCNAME: GOPATH: Adding vendor path ${x}"
			ebegin "- ${x//${WORKDIR}\//}"
				GOPATH="${GOPATH}:${x}"
			eend
		done

		export GOPATH
	fi

	# Define the output binary name of the package.
	# If the package is a multiple package then we don't specify the output
	local EGO_OUTPUT
	[[ -z ${GOLANG_PKG_IS_MULTIPLE} ]] && EGO_OUTPUT="-o ${GOBIN}/${GOLANG_PKG_OUTPUT_NAME}"

	# Define the install suffix.
	local EGO_INSTALLSUFFIX
	[[ -z ${GOLANG_PKG_INSTALLSUFFIX} ]] || EGO_INSTALLSUFFIX="-installsuffix=${GOLANG_PKG_INSTALLSUFFIX}"

	# Define the level of verbosity.
	local EGO_VERBOSE="-v"
	[[ -z ${PORTAGE_VERBOSE} ]] || EGO_VERBOSE+=" -x"

	# Define the number of builds that can be run in parallel.
	local EGO_PARALLEL="-p $(makeopts_jobs)"

	# Define extra options.
	local EGO_EXTRA_OPTIONS="-a"

	# Prepare build flags for the go toolchain.
	local EGO_BUILD_FLAGS="${EGO_INSTALLSUFFIX} ${EGO_OUTPUT} ${EGO_VERBOSE} ${EGO_PARALLEL} ${EGO_EXTRA_OPTIONS} ${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}${GOLANG_PKG_BUILDPATH}"

	# Build the package.
	if [[ -n ${GOLANG_PKG_LDFLAGS} ]]; then
		# Specifies the arguments for the linker invocation.
		# WORKAROUND: 6l has several problems parsing certain flags when invoked
		#             from a shell script; these bugs'll be fixed in go v1.5+
		einfo "${EGO} build -ldflags='$GOLANG_PKG_LDFLAGS' ${EGO_BUILD_FLAGS}"
		${EGO} build -ldflags="$GOLANG_PKG_LDFLAGS" ${EGO_BUILD_FLAGS} || die
	else
		einfo "${EGO} build ${EGO_BUILD_FLAGS}"
		${EGO} build ${EGO_BUILD_FLAGS} || die
	fi
}


# @FUNCTION: golang-single_src_install
# @DESCRIPTION:
# Installs binaries and documents from DOCS or HTML_DOCS arrays.
golang-single_src_install() {
	debug-print-function ${FUNCNAME} "${@}"

	# Define the arguments for the linker invocation.
	local EGO_LDFLAGS
	#[[ -z ${GOLANG_PKG_LDFLAGS} ]] || EGO_LDFLAGS="-ldflags '${GOLANG_PKG_LDFLAGS}'"

	# Define the install suffix.
	local EGO_INSTALLSUFFIX
	[[ -z ${GOLANG_PKG_INSTALLSUFFIX} ]] || EGO_INSTALLSUFFIX="-installsuffix=${GOLANG_PKG_INSTALLSUFFIX}"

	# Define the level of verbosity.
	local EGO_VERBOSE="-v"
	[[ -z ${PORTAGE_VERBOSE} ]] || EGO_VERBOSE+=" -x"

	# Define the number of builds that can be run in parallel.
	local EGO_PARALLEL="-p $(makeopts_jobs)"

	# Define extra options.
	local EGO_EXTRA_OPTIONS=""

	# Prepare build flags for the go toolchain.
	local EGO_BUILD_FLAGS="${EGO_LDFLAGS} ${EGO_INSTALLSUFFIX} ${EGO_VERBOSE} ${EGO_PARALLEL} ${EGO_EXTRA_OPTIONS} ${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}${GOLANG_PKG_BUILDPATH}"

	# Execute the pre-install phase (go install).
	if [[ -n ${GOLANG_PKG_IS_MULTIPLE} ]]; then
		einfo "${EGO} install ${EGO_BUILD_FLAGS}"
		${EGO} install ${EGO_BUILD_FLAGS} || die
	fi

	# Install binaries.
	into ${GOLANG_PKG_INSTALLPATH}
	for bin in "${GOBIN}"/* ; do
		dobin ${bin}
	done

	# Install documentation.
	base_src_install_docs
}


# @FUNCTION: golang-single_src_test
# @DESCRIPTION:
# Runs the unit tests for the main package.
golang-single_src_test() {
	debug-print-function ${FUNCNAME} "${@}"

	[[ ${EGO} ]] || die "No GoLang implementation set (pkg_setup not called?)."

	# Add GOBIN to the main PATH.
	# FIX: this is necessary for the tests that need to invoke bins from GOBIN.
	export PATH="${GOBIN}:${PATH}"

	# Creates a symbolic link of GOBIN inside S.
	# FIX: required by unit tests executing bins from $S/bin instead of $GOBIN
	ln -s "${GOBIN}" "${S}/bin" || die

	# Define the level of verbosity.
	local EGO_VERBOSE="-v"
	[[ -z ${PORTAGE_VERBOSE} ]] || EGO_VERBOSE+=" -x"

	# Define the number of builds that can be run in parallel.
	local EGO_PARALLEL="-p $(makeopts_jobs)"

	# Define extra options.
	local EGO_EXTRA_OPTIONS="-a"

	# Prepare build flags for the go toolchain.
	local EGO_BUILD_FLAGS="${EGO_VERBOSE} ${EGO_PARALLEL} ${EGO_EXTRA_OPTIONS} ${GOLANG_PKG_IMPORTPATH_ALIAS}/${GOLANG_PKG_NAME}${GOLANG_PKG_BUILDPATH}/..."

	# Runs the unit tests.
	einfo "${EGO} test ${EGO_BUILD_FLAGS}"
	${EGO} test ${EGO_BUILD_FLAGS} || die
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
golang_fix_importpath_alias() {
	debug-print-function ${FUNCNAME} "${@}"

	[[ ${1} ]] || die "${FUNCNAME}: no paths given"

	local TARGET="${1}"
	local ALIAS="${2}"

	mkdir -p "${GOPATH}/src/${ALIAS%/*}" || die
	ebegin "Fixing ${TARGET} as ${ALIAS}"
		ln -sf "${GOPATH}/src/${TARGET}" \
			"${GOPATH}/src/${ALIAS}" \
			|| die
	eend
}
