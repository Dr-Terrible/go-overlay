# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN//-inotify}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.Version=v${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/syncthing/syncthing:b7e2198" #v0.14.10
	"github.com/cenkalti/backoff:b02f2bb"
	"github.com/zillode/notify:df33c1a"
	"github.com/gobwas/glob:0354991" #v0.2.1
)

inherit systemd golang-single

DESCRIPTION="File watcher intended for use with Syncthing"
HOMEPAGE="https://syncthing.net"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="!net-misc/${PN}"

src_install() {
	# Install the package
	golang-single_src_install

	# Install systemd services
	systemd_dounit "${S}"/etc/linux-systemd/system/${PN}@.service
	systemd_douserunit "${S}"/etc/linux-systemd/user/${PN}.service

	# Install OpenRC init.d file. Note that we use OpenRC's
	# multiplexed configuration file feature for syncthing.inotify,
	# which means that syncthing inotify uses the configuration file
	# from syncthing.
	newinitd "${FILESDIR}/${PN}.initd" syncthing.inotify
}
