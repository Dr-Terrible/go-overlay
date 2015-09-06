# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/go-gitea"
GOLANG_PKG_VERSION="61cfcef4d857e1fbcff1d97c2ae92ba111a191ab"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bradfitz/gomemcache:72a68649ba"
	"github.com/Unknwon/cae:2e70a1351b"
	"github.com/Unknwon/com:188d690b1a"
	"github.com/Unknwon/i18n:7457d88830"
	"github.com/Unknwon/macaron:93de4f3fad"
	"github.com/codegangsta/cli:142e6cd241"
	"github.com/go-sql-driver/mysql:a197e5d405"
	"github.com/go-xorm/core:be6e7ac47d"
	"github.com/go-xorm/xorm:1f0dd9bef2"
	"github.com/gogits/chardet:2404f77725"
	"github.com/gogits/go-gogs-client:92e76d616a"
	"github.com/lib/pq:30ed2200d7"
	"github.com/macaron-contrib/binding:548a793679"
	"github.com/macaron-contrib/cache:928d5c35cd"
	"github.com/macaron-contrib/captcha:fbb8b1ebb5"
	"github.com/macaron-contrib/csrf:98ddf5a710"
	"github.com/macaron-contrib/i18n:da2b19e90b"
	"github.com/macaron-contrib/oauth2:8f394c3629"
	"github.com/macaron-contrib/session:31e841d95c"
	"github.com/macaron-contrib/toolbox:acbfe36e16"
	"github.com/mattn/go-sqlite3:e28cd440fa"
	"github.com/microcosm-cc/bluemonday:fcd0f5074e"
	"github.com/nfnt/resize:53e9ca890b"
	"github.com/russross/blackfriday:8cec3a854e"
	"github.com/shurcooL/go:bc30a0bd33"
	"github.com/shurcooL/sanitized_anchor_name:11a20b799b"
	"github.com/golang/net:669b27b881 -> golang.org/x"
	"github.com/golang/text:d611288f0d -> golang.org/x"
	"github.com/go-ini/ini:177219109c -> gopkg.in/ini.v1"
	"github.com/go-redis/redis:e617904962 -> gopkg.in/redis.v2"
	"github.com/go-bufio/bufio:567b2bfa51 -> gopkg.in/bufio.v1"

	# Unit testing
	"github.com/golang/crypto:1e856cbfdf -> golang.org/x"
)

inherit user systemd golang-single

DESCRIPTION="Gitea is a self-hosted Git service written in Go"
HOMEPAGE="https://gitea.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+sqlite redis memcached +ssl"

DEPEND="dev-go/go-bindata
	sqlite? ( dev-db/sqlite:3 )
	redis? ( dev-db/redis )
	memcached? ( net-misc/memcached )"
RDEPEND="${DEPEND}
	ssl? ( net-misc/openssh )
	dev-vcs/git[curl,threads]"

use test && RESTRICT+=" sandbox"

GITEA_REPO_DIR="/var/lib/${PN}"
GITEA_APP_DIR="/usr/share/${PN}"

pkg_setup() {
	ebegin "Creating git user and group"
		enewgroup git
		enewuser git -1 /bin/sh "${GITEA_REPO_DIR}" git
	eend $?
}

src_prepare() {
	golang-single_src_prepare

	# FIX:
	sed -i \
		-e "s:^STATIC_ROOT_PATH =.*:STATIC_ROOT_PATH = ${EPREFIX}/usr/share/${PN}:" \
		-e "s:^ROOT_PATH =.*:ROOT_PATH = ${EPREFIX}/var/log/${PN}:" \
		-e "s:^MODE =.*:MODE = console,file:" \
		-e "s:^PATH = data/gogs.db:PATH = ${EPREFIX}/var/lib/${PN}/data/gogs.db:" \
		conf/app.ini || die
}

src_compile() {

	ebegin "Building binary data"
		go-bindata -o=modules/bindata/bindata.go \
			-ignore="\\.DS_Store|README" \
			-pkg=bindata \
			conf/... || die
	eend

	GOLANG_PKG_TAGS=""

	use sqlite && GOLANG_PKG_TAGS+=" sqlite"
	use redis && GOLANG_PKG_TAGS+=" redis"
	use memcached && GOLANG_PKG_TAGS+=" memcache"
	use ssl && GOLANG_PKG_TAGS+=" cert"

	golang-single_src_compile
}

src_install() {
	golang-single_src_install

	# Install custom configuration files
	keepdir ${GITEA_APP_DIR}/custom/conf
	use ssl && keepdir ${GITEA_APP_DIR}/custom/https
	touch "${ED}"/${GITEA_APP_DIR}/custom/conf/app.ini || die
	fperms 660 ${GITEA_APP_DIR}/custom/conf/app.ini

	# Install theme files
	insinto ${GITEA_APP_DIR}
	doins -r public/
	doins -r templates/
	fowners -R :git ${GITEA_APP_DIR}

	# Install init scripts
	systemd_dounit "${FILESDIR}/systemd/${PN}.service"
	systemd_dotmpfilesd "${FILESDIR}/systemd/${PN}.conf"

	# Create log directory
	keepdir /var/log/${PN}
	fowners -R git:git /var/log/${PN}

	# Create repositories directory
	keepdir ${GITEA_REPO_DIR}
	fowners -R git:git ${GITEA_REPO_DIR}
}

pkg_postinst() { :; }