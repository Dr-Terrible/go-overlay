# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_TAGS="noupgrade"
GOLANG_PKG_LDFLAGS="-w -X main.Version=v${PV} -X main.BuildUser=portage -X main.BuildHost=gentoo -X main.BuildStamp=$( date +%s )"
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

inherit user systemd golang-single

EDOC_COMMIT="648e3b77d7ab597bb0d20adccd4ab089c0e6e190"

DESCRIPTION="Syncthing is an app that lets you synchronize your files across multiple devices"
HOMEPAGE="http://syncthing.net"
SRC_URI+=" doc? ( https://github.com/${PN}/docs/archive/${EDOC_COMMIT}.tar.gz -> ${PN}-docs-${EDOC_COMMIT}.tar.gz )"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE+=" cli doc inotify"

DEPEND=">=dev-lang/go-1.5.3
	doc? ( dev-python/sphinx )"
RDEPEND="cli? ( net-misc/syncthing-cli )
	inotify? ( net-misc/syncthing-inotify )"

SYNCTHING_HOME="/var/lib/${PN}"

pkg_setup() {
	enewuser ${PN} -1 -1 "${SYNCTHING_HOME}"
}

src_compile() {
	golang-single_src_compile

	# compile documentation
	if use doc; then
		emake singlehtml -C "${WORKDIR}"/docs-${EDOC_COMMIT} || die
	fi
}

src_install() {
	# install the package
	golang-single_src_install

	# install man pages
	doman man/${PN}*

	# install documentation
	use doc && dohtml -r "${WORKDIR}"/docs-${EDOC_COMMIT}/_build/singlehtml/*

	# install systemd services
	systemd_dounit "${S}"/etc/linux-systemd/system/${PN}@.service
	systemd_douserunit "${S}"/etc/linux-systemd/user/${PN}.service

	# Install OpenRC init.d and conf.d files.
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
	newconfd "${FILESDIR}/${PN}.confd" ${PN}

	diropts "-m0700 -o${PN}"
	dodir "${SYNCTHING_HOME}"
}
