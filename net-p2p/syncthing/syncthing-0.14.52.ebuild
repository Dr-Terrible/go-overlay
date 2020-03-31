# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_TAGS="noupgrade"
GOLANG_PKG_LDFLAGS="-w -X main.Version=v${PV} -X main.BuildUser=portage -X main.BuildHost=gentoo"

inherit user systemd golang-single

EDOC_COMMIT="cd28cad885dea0e3afe8f1929a489cc3f626800f"

DESCRIPTION="Syncthing is an app that lets you synchronize your files across multiple devices"
HOMEPAGE="https://syncthing.net"
SRC_URI+=" doc? ( https://github.com/${PN}/docs/archive/${EDOC_COMMIT}.tar.gz -> ${PN}-docs-${EDOC_COMMIT}.tar.gz )"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="cli doc"

RESTRICT+=" test"

DEPEND="doc? ( dev-python/sphinx )"
RDEPEND="!net-misc/${PN}
	!<net-p2p/${PN}-0.13.99"

DOCS=( README.md AUTHORS CONTRIBUTING.md )

SYNCTHING_HOME="/var/lib/${PN}"

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 "${SYNCTHING_HOME}"

	GOLANG_PKG_LDFLAGS+=" -X main.BuildStamp=$( date +%s )"
}

src_compile() {
	# generate assets
	go run build.go assets

	# building app
	use cli && GOLANG_PKG_BUILDPATH+=" /cmd/stcli"
	golang-single_src_compile

	# compile documentation
	if use doc; then
		pushd "${WORKDIR}"/docs-${EDOC_COMMIT} || die
			emake html
		popd || die
	fi
}

src_install() {
	# install the app
	golang-single_src_install

	# install man pages
	doman man/*.[157]

	# install documentation
	if use doc; then
		pushd "${WORKDIR}"/docs-${EDOC_COMMIT} || die
			docinto html
			dodoc -r "${WORKDIR}"/docs-${EDOC_COMMIT}/_build/html/*
		popd || die
	fi

	# install systemd services
	systemd_dounit "${S}"/etc/linux-systemd/system/${PN}{@,-resume}.service
	systemd_douserunit "${S}"/etc/linux-systemd/user/${PN}.service

	# Install OpenRC init.d and conf.d files.
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
	newconfd "${FILESDIR}/${PN}.confd" ${PN}

	keepdir /var/{lib,log}/${PN}
	fowners ${PN}:${PN} /var/{lib,log}/${PN}

	insinto /etc/logrotate.d
	newins "${FILESDIR}/${PN}.logrotate" ${PN}
}
