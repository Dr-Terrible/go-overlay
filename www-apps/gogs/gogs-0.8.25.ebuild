# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/gogits"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X github.com/gogits/gogs/modules/setting.BuildTime=$(date -u '+%Y-%m-%d')"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

# Dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/alexcesaro/quotedprintable:2caba25 -> gopkg.in/alexcesaro/quotedprintable.v3"
	"github.com/bradfitz/gomemcache:fb1f79c"
	"github.com/Unknwon/cae:7f5e046"
	"github.com/Unknwon/com:28b053d"
	"github.com/Unknwon/i18n:3b48b66"
	"github.com/Unknwon/paginater:7748a72"
	"github.com/codegangsta/cli:cf1f63a"
	"github.com/go-macaron/binding:2502aaf"
	"github.com/go-macaron/cache:5617353"
	"github.com/go-macaron/captcha:8aa5919"
	"github.com/go-macaron/csrf:715bca0"
	"github.com/go-macaron/gzip:4938e9b"
	"github.com/go-macaron/i18n:d2d3329"
	"github.com/go-macaron/inject:c5ab7bf"
	"github.com/go-macaron/session:66031fc"
	"github.com/go-macaron/toolbox:82b5115"
	"github.com/go-sql-driver/mysql:b4db83c"
	"github.com/go-xorm/core:1e2868c"
	"github.com/go-xorm/xorm:24c1f3c"
	"github.com/gogits/chardet:2404f77"
	"github.com/gogits/go-gogs-client:2f4342d"
	"github.com/gogits/git-module:3b40eae"
	"github.com/issue9/identicon:f8c0d2c"
	"github.com/klauspost/compress:91e7b09"
	"github.com/klauspost/cpuid:349c675"
	"github.com/klauspost/crc32:999f312"
	"github.com/lib/pq:8ad2b29"
	"github.com/mattn/go-sqlite3:0cc1174"
	"github.com/mcuadros/go-version:d52711f"
	"github.com/microcosm-cc/bluemonday:4ac6f27"
	"github.com/msteinert/pam:02ccfbf"
	"github.com/nfnt/resize:4d93a29"
	"github.com/russross/blackfriday:006144a"
	"github.com/shurcooL/sanitized_anchor_name:10ef21a"
	"github.com/sergi/go-diff:ec7fdbb"
	"github.com/golang/net:04b9de9 -> golang.org/x"
	"github.com/golang/text:6fc2e00 -> golang.org/x"
	"github.com/go-gomail/gomail:fbb71dd -> gopkg.in/gomail.v2"
	"github.com/go-ini/ini:afbd495 -> gopkg.in/ini.v1"
	"github.com/go-macaron/macaron:564f398 -> gopkg.in/macaron.v1"
	"github.com/go-redis/redis:e617904 -> gopkg.in/redis.v2" #v2.3.2
	"github.com/go-bufio/bufio:567b2bf -> gopkg.in/bufio.v1"
	"github.com/go-ldap/ldap:e9a325d -> gopkg.in/ldap.v2" #v2.2
	"github.com/go-asn1-ber/asn1-ber:4e86f43 -> gopkg.in/asn1-ber.v1" #v1.1

	# tidb
	"github.com/go-xorm/tidb:c670be9"
	"github.com/ngaut/log:37d3e0f"
	"github.com/pingcap/tidb:151e8b1"
	"github.com/boltdb/bolt:ee716d1" #v1.1.0
	"github.com/juju/errors:1b5e39b"
	"github.com/ngaut/pool:4406601"
	"github.com/pingcap/check:3b578b2"
	"github.com/pingcap/go-hbase:8e85130"
	"github.com/pingcap/go-themis:a576b06"
	"github.com/syndtr/goleveldb:1a9d62f"
	"github.com/twinj/uuid:89173bc"
	"github.com/golang/protobuf:02ac84f"
	"github.com/golang/snappy:723cc1e"
	"github.com/ngaut/go-zookeeper:9c3719e"
	"github.com/ngaut/tso:f528289"
	"github.com/ngaut/deadline:fae8f9d"

	# Unit testing
	"github.com/golang/crypto:1f22c01 -> golang.org/x"
	"github.com/smartystreets/goconvey:5bb9e11"
	"github.com/smartystreets/assertions:01fedaa"
	"github.com/jtolds/gls:9a4a02d"
)

inherit user systemd golang-single

DESCRIPTION="Gogs is a self-hosted Git service written in Go"
HOMEPAGE="https://gogs.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE_CACHE_ADAPTER="redis memcached"
IUSE_DATABASE_ADAPTER="mysql postgres +sqlite tidb"
IUSE="$IUSE_DATABASE_ADAPTER $IUSE_CACHE_ADAPTER pam +ssl"

REQUIRED_USE="|| ( sqlite tidb mysql postgres )"

DEPEND=">dev-go/go-bindata-3.0.7
	sqlite? ( dev-db/sqlite:3 )
	redis? ( dev-db/redis )
	tidb? ( dev-db/tidb )
	memcached? ( net-misc/memcached )"
RDEPEND="${DEPEND}
	app-shells/bash
	dev-vcs/git[curl,threads]
	pam? ( virtual/pam )
	ssl? ( net-misc/openssh )
	mysql? ( virtual/mysql )
	postgres? ( dev-db/postgresql )"

USER_NAME="gogs"
USER_DIR="/var/lib/${USER_NAME}"
APP_DIR="/usr/share/${PN}"

pkg_setup() {
	enewgroup ${USER_NAME}
	enewuser ${USER_NAME} -1 /bin/bash "${USER_DIR}" ${USER_NAME}
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
	# NOTE: here the ebuild sets common value for both the main app.ini
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

src_install() {
	golang-single_src_install

	# Install init scripts
	systemd_dounit "${FILESDIR}/systemd/${PN}.service"
	systemd_newuserunit "${FILESDIR}/systemd/${PN}.user.service" "${PN}.service"
	systemd_dotmpfilesd "${FILESDIR}/systemd/${PN}.conf"

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
	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}

pkg_postinst() {
	elog
	elog "If you want to enable Gogs as a standalone centralized web service"
	elog "when your system boots, then execute the following commands:"
	elog "$   systemctl enable gogs.service"
	elog "$   systemctl start gogs.service"
	elog
	elog "If this is a new install point your browser to: https://localhost:3000"
	elog "and complete the installation process."
	echo

	elog
	elog "Instead, if you want to enable Gogs as a non centralized web service"
	elog "when your user log in, then execute the following commands"
	elog "as a logged user (non root):"
	elog "$   systemctl --user enable gogs.service"
	elog "$   systemctl --user start gogs.service"
	elog
	elog "The user must be in the '${USER_NAME}' group to be able to properly"
	elog "run Gogs as a non centralized web service."
	elog "Just run (replace <USER> with the desired username):"
	elog "$   gpasswd -a <USER> ${USER_NAME}"
	elog "then have <USER> re-login."
	echo
}
