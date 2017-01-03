# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_TAGS="noupgrade"
GOLANG_PKG_LDFLAGS="-w -X main.Version=v${PV} -X main.BuildUser=portage -X main.BuildHost=gentoo -X main.BuildStamp=$( date +%s )"

inherit user systemd golang-single

EDOC_COMMIT="5a07b087cc38f9fc77170223acc600bc0a2e9f4d"

DESCRIPTION="Syncthing is an app that lets you synchronize your files across multiple devices"
HOMEPAGE="https://syncthing.net"
SRC_URI+=" doc? ( https://github.com/${PN}/docs/archive/${EDOC_COMMIT}.tar.gz -> ${PN}-docs-${EDOC_COMMIT}.tar.gz )"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE+=" cli doc inotify"

RESTRICT+=" test"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND="!net-misc/${PN}
	!<net-p2p/${PN}-0.13.99
	cli? ( net-p2p/syncthing-cli )
	inotify? ( net-p2p/syncthing-inotify )"

SYNCTHING_HOME="/var/lib/${PN}"

pkg_setup() {
	enewuser ${PN} -1 -1 "${SYNCTHING_HOME}"
}

src_compile() {
	# generate assets
	go run build.go assets

	# building app
	golang-single_src_compile

	# compile documentation
	if use doc; then
		emake singlehtml -C "${WORKDIR}"/docs-${EDOC_COMMIT} || die
	fi
}

src_install() {
	# install the app
	golang-single_src_install

	# install man pages
	doman man/*.[157]

	# install documentation
	if use doc; then
		docinto html
		dodoc -r "${WORKDIR}"/docs-${EDOC_COMMIT}/_build/singlehtml/*
	fi

	# install systemd services
	systemd_dounit \
		"${S}"/etc/linux-systemd/system/${PN}@.service \
		"${S}"/etc/linux-systemd/system/${PN}-resume.service
	systemd_douserunit "${S}"/etc/linux-systemd/user/${PN}.service

	# Install OpenRC init.d and conf.d files.
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
	newconfd "${FILESDIR}/${PN}.confd" ${PN}

	keepdir /var/{lib,log}/${PN}
	fowners ${PN}:${PN} /var/{lib,log}/${PN}

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" ${PN}
}
