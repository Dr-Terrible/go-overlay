# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/syncthing"
GOLANG_PKG_TAGS="noupgrade"
GOLANG_PKG_LDFLAGS="-X main.Version=v${PV} -X main.BuildUser=portage -X main.BuildHost=gentoo"
GOLANG_PKG_HAVE_TEST=1

inherit systemd golang-single

DESCRIPTION="Syncthing is an application that lets you synchronize your files across multiple devices"
HOMEPAGE="http://syncthing.net"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="systemd"

use test && RESTRICT="sandbox"

RDEPEND="systemd? ( >=sys-apps/systemd-219 )"

src_install() {
	# install the package
	golang-single_src_install

	# install systemd services
	if use systemd; then
		systemd_dounit "${S}"/etc/linux-systemd/system/${PN}@.service
		systemd_douserunit "${S}"/etc/linux-systemd/user/${PN}.service
	fi
}