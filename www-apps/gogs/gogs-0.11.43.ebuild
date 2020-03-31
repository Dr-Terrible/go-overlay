# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/gogits"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X github.com/gogits/gogs/modules/setting.BuildGitHash=2978bb1"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

inherit user systemd golang-single

DESCRIPTION="Gogs is a self-hosted Git service written in Go"
HOMEPAGE="https://gogs.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

IUSE_CACHE_ADAPTER="redis memcached"
IUSE_DATABASE_ADAPTER="mysql postgres +sqlite tidb"
IUSE="$IUSE_DATABASE_ADAPTER $IUSE_CACHE_ADAPTER +pam +ssl"

REQUIRED_USE="|| ( sqlite tidb mysql postgres )"

DEPEND=">dev-go/go-bindata-3.0.7
	sqlite? ( dev-db/sqlite:3 )
	redis? ( dev-db/redis )
	tidb? ( dev-db/tidb )
	memcached? ( net-misc/memcached )"
RDEPEND="${DEPEND}
	app-shells/bash
	dev-vcs/git[curl,threads]
	pam? ( sys-libs/pam )
	ssl? ( net-misc/openssh )
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql[pam?,ssl?] )"

USER_NAME="gogs"
USER_DIR="/var/lib/${USER_NAME}"
APP_DIR="/usr/share/${PN}"

pkg_setup() {
	enewgroup ${USER_NAME}
	enewuser ${USER_NAME} -1 /bin/bash "${USER_DIR}" ${USER_NAME}
	GOLANG_PKG_LDFLAGS+=" -X github.com/gogits/gogs/modules/setting.BuildTime=$(date -u '+%Y-%m-%d')"
}

src_prepare() {
	golang-single_src_prepare

	# FIX:
#		-e "s:^PATH = data/attachments:PATH = ${EPREFIX}${APP_DIR}/data/attachments:" \
#		-e "s:^PROVIDER_CONFIG =.*:PROVIDER_CONFIG = ${EPREFIX}${APP_DIR}/data/sessions:" \
#		-e "s:^AVATAR_UPLOAD_PATH =.*: AVATAR_UPLOAD_PATH = ${EPREFIX}${APP_DIR}/data/avatars:" \
#		-e "s:^LEVEL =.*:LEVEL = Trace:" \
#		-e "s:^GOGS_CUSTOM =.*:GOGS_CUSTOM = ${EPREFIX}/usr/share/${PN}:" \

	cp conf/app.ini "${T}"/app.user.ini || die

	# Change the default values to LHS compliant one
	# NOTE: here the ebuild sets common values for both the main app.ini
	#       and the one used by users.
	sed -i \
		-e "s:^PATH = data/gogs.db:PATH = database/${PN}.db:" \
		-e "s:^STATIC_ROOT_PATH =.*:STATIC_ROOT_PATH = ${EPREFIX}/usr/share/themes/${PN}:" \
		-e "s:^MODE =.*:MODE = console:" \
		-e "s:^OFFLINE_MODE =.*:OFFLINE_MODE = true:" \
		-e "s:^DISABLE_ROUTER_LOG =.*:DISABLE_ROUTER_LOG = true:" \
		-e "s:^DISABLE_GRAVATAR =.*:DISABLE_GRAVATAR = true:" \
		-e "s:^PROVIDER =.*:PROVIDER = memory:" \
		-e "s:^RUN_MODE =.*:RUN_MODE = prod:" \
		-e "s:^# NEVER EVER.*::" \
		-e "s:^# PLEASE MAKE.*::" \
		conf/app.ini "${T}"/app.user.ini || die

	# Fallback for sqlite as main backend
	if use sqlite; then
		sed -i \
			-e "s:^DB_TYPE = mysql.*:DB_TYPE = sqlite3:" \
			conf/app.ini "${T}"/app.user.ini || die
	fi

	# These are settings specific only to the main app.ini.
	sed -i \
		-e "s:^ROOT_PATH =.*:ROOT_PATH = ${EPREFIX}/var/log/${PN}:" \
		-e "s:^ROOT =.*:ROOT = ${EPREFIX}${USER_DIR}/repositories:" \
		-e "s:^RUN_USER =.*:RUN_USER = ${USER_NAME}:" \
		conf/app.ini || die

	# These are settings specific only to the app.ini used by users.
	sed -i \
		-e "s:^ROOT_PATH =.*:ROOT_PATH = <home>/${PN}/log:" \
		-e "s:^ROOT =.*:ROOT = <home>/${PN}/repositories:" \
		-e "s:^RUN_USER =.*:RUN_USER = <user>:" \
		"${T}"/app.user.ini || die
}

src_compile() {
	ebegin "Building binary data"
		go-bindata \
			-nomemcopy \
			-o=modules/bindata/bindata.go \
			-ignore="\\.DS_Store|README" \
			-pkg=bindata \
			conf/... || die
	eend

	GOLANG_PKG_TAGS=""

	use sqlite && GOLANG_PKG_TAGS+=" sqlite"
	use redis && GOLANG_PKG_TAGS+=" redis"
	use tidb && GOLANG_PKG_TAGS+=" tidb"
	use memcached && GOLANG_PKG_TAGS+=" memcache"
	use ssl && GOLANG_PKG_TAGS+=" cert"
	use pam && GOLANG_PKG_TAGS+=" pam"

	golang-single_src_compile
}

enable_systemd_dep() {
	[[ -z ${1} ]] && die "enable_systemd_dep requires a parameter"

	cat <<EOF >> "${T}"/${PN}.service

[Unit]
After=${1}.service
Requires=${1}.service
EOF
}

src_install() {
	golang-single_src_install

	# Prepare systemd init scripts
	cp "${FILESDIR}/systemd/${PN}.service" "${T}/${PN}.service" || die
	use memcached && enable_systemd_dep memcached
	use redis && enable_systemd_dep redis
	use mysql && enable_systemd_dep mysqld
	use postgres && enable_systemd_dep postgresql

	# Install init scripts
	systemd_dounit "${T}/${PN}.service"
	systemd_newuserunit "${FILESDIR}/systemd/${PN}.user.service" "${PN}.service"
	systemd_dotmpfilesd "${FILESDIR}/systemd/${PN}.conf"

	# Install init files
	doconfd "${FILESDIR}/conf.d/gogs"
	doinitd "${FILESDIR}/init.d/gogs"

	# Install HTTPS certs
	if use ssl; then
		keepdir /etc/${PN}/https
	fi

	# Install configuration files
	insinto /etc/${PN}/conf
	insopts -m640
	doins "${T}"/app.user.ini
	doins conf/app.ini

	# Fix permissions of config files
	keepdir /etc/${PN}/
	fperms 775 /etc/${PN}/conf
	fowners -R :${USER_NAME} /etc/${PN}

	# Install theme files
	insinto /usr/share/themes/${PN}/
	insopts -m440
	doins -r public/
	doins -r templates/
	fowners -R ${USER_NAME}:${USER_NAME} /usr/share/themes/${PN}/

	# Create log directory
	keepdir /var/log/${PN}
#	fperms 775 /var/log/${PN}
	fowners -R ${USER_NAME}:${USER_NAME} /var/log/${PN}
}

src_test() {
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}

pkg_postinst() {
	echo
	elog "If you want to enable Gogs as a standalone centralized web service"
	elog "when your system boots, then execute the following commands:"
	elog "  $ systemctl enable gogs.service"
	elog "  $ systemctl start gogs.service"
	elog
	elog "If this is a new install point your browser to: https://localhost:3000"
	elog "and complete the installation process."
	echo
	elog "Instead, if you want to enable Gogs as a non centralized web service"
	elog "when your user log in, then execute the following commands"
	elog "as a logged user (non root):"
	elog "  $ systemctl --user enable gogs.service"
	elog "  $ systemctl --user start gogs.service"
	elog
	elog "The user must be in the '${USER_NAME}' group to be able to properly"
	elog "run Gogs as a non centralized web service:"
	elog "  $ gpasswd -a <USER> ${USER_NAME}"
	elog "Just run (replace <USER> with the desired username),"
	elog "then have <USER> re-login."
	echo
}
