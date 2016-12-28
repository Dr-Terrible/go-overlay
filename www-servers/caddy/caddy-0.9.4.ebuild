# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EDOC_COMMIT="0831e3278fac230c3986a5ce62d55a6af89c4605"

GOLANG_PKG_IMPORTPATH="github.com/mholt"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/${PN}"
PKG="${GOLANG_PKG_IMPORTPATH}/${PN}/${PN}/${PN}main"
GOLANG_PKG_LDFLAGS="-X ${PKG}.appVersion=v${PV} -X ${PKG}.gitTag=v${PV} -X ${PKG}.gitCommit=c885edd -X \"${PKG}.buildDate=$( date -u +"%a %b %d %H:%M:%S %Z %Y" )\""
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/dustin/go-humanize:bd88f87"
	"github.com/flynn/go-shlex:3f9db97"
	"github.com/gorilla/websocket:3ab3a8b" #v1.1.0
	"github.com/hashicorp/go-syslog:315de0c"
	"github.com/jimstudt/http-authentication:3eca13d"
	"github.com/lucas-clemente/quic-go:1d7cf74" #v0.4
	"github.com/naoina/toml:7511716" #v0.1.0
	"github.com/russross/blackfriday:5f33e7b"
	"github.com/xenolf/lego:ce8fb06"
	"github.com/golang/crypto:dc7f3af -> golang.org/x"
	"github.com/golang/net:cf4effb -> golang.org/x"
	"github.com/natefinch/lumberjack:e21e5cb -> gopkg.in/natefinch/lumberjack.v2" #v2.0
	"github.com/go-yaml/yaml:a5b47d3 -> gopkg.in/yaml.v2"
	"github.com/lucas-clemente/aes12:8ee5b56"
	"github.com/lucas-clemente/fnv128a:393af48"
	"github.com/lucas-clemente/quic-go-certificates:d2f8652"
	"github.com/miekg/dns:fc4e1e2"
	"github.com/naoina/go-stringutil:6b638e9" #0.1.0
	"github.com/shurcooL/sanitized_anchor_name:1dba4b3"
	"github.com/square/go-jose:aa2e30f -> gopkg.in/square/go-jose.v1" #v1.1.0
)

inherit user systemd golang-single

DESCRIPTION="Fast, cross-platform HTTP/2 web server with automatic HTTPS"
HOMEPAGE="https://caddyserver.com"
SRC_URI+=" doc? ( https://github.com/${PN}server/${PN}server.com/archive/${EDOC_COMMIT}.tar.gz -> ${PF}-doc.tar.gz )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

ADDONS=""
IUSE="doc $ADDONS"

DEPEND="doc? ( www-apps/hugo )"

#PATCHES=( "${FILESDIR}"/${PN}-systemd.patch )

USER_NAME="${PN}"
USER_DIR="/var/lib/${USER_NAME}"

pkg_setup() {
	enewgroup ${USER_NAME}
	enewuser ${USER_NAME} -1 /bin/bash "${USER_DIR}" ${USER_NAME}
}

src_prepare() {
	golang-single_src_prepare

	# Fix systemd unit file
	sed -i \
		-e "s:www-data:${USER_NAME}:" \
		-e "s:/usr/local/bin:/usr/bin:" \
		dist/init/linux-systemd/caddy.service || die
}

src_install() {
	golang-single_src_install

	# install systemd services
	systemd_newunit dist/init/linux-systemd/${PN}.service "${PN}@.service"

	if use doc; then
		pushd "${WORKDIR}"/${PN}server.com-${EDOC_COMMIT}
			hugo -v \
    	        -d "${T}"/docs \
	        	--baseURL="file:///usr/share/doc/${PF}/html/" \
            	--canonifyURLs=true \
        	    --uglyURLs=true \
    	        --disableRSS=true \
	        	--disableSitemap=true \
            	--noTimes=true \
        	    || die
		popd

		docinto html
		dodoc -r "${T}"/docs/*
	fi
}

pkg_postinst() {
	elog "The user must be in the '${USER_NAME}' group to be able to properly run Caddy."
	elog "Just run (replace <USER> with the desired username):"
	elog "$   gpasswd -a <USER> ${USER_NAME}"
	elog "then have <USER> re-login."
	echo
}
