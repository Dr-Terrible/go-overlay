# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit qt4-r2

DESCRIPTION="LiteIDE is a simple, open source, cross-platform Go IDE."
HOMEPAGE="http://code.google.com/p/liteide"
SRC_URI="https://github.com/visualfc/${PN}/archive/x${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86 ~arm ~amd64-fbsd ~x86-fbsd"
SLOT="0"
IUSE="debug gdb kernel_linux kernel_FreeBSD test +tools"

DEPEND="dev-qt/qtgui:4
	dev-qt/qtwebkit:4"
RDEPEND="${DEPEND}
	dev-go/liteide-tools
	tools? (
		dev-go/gocode
	)
	gdb? ( sys-devel/gdb )"

S="${WORKDIR}/${PN}-x${PV}"

RESTRICT+=" mirror"

DOCS=(
	"${S}"/liteidex/LICENSE.LGPL
	"${S}"/liteidex/LGPL_EXCEPTION.TXT
	"${S}"/README.md
	"${S}"/CONTRIBUTORS
)

src_configure() {
	export QTDIR="${EPREFIX}/usr"
	export BUILD_ROOT="${S}/build"
	export LITEIDE_ROOT="${S}/liteidex"

	cd "${S}"/liteidex/ || die
	eqmake4
}

src_compile() {
	# compile liteide
	cd "${S}"/liteidex/ || die
	qt4-r2_src_compile
}

src_install() {
	# install liteide
	cd "${S}"/liteidex/ || die
	qt4-r2_src_install DESTDIR="${D}opt/${PN}/" INSTALL_ROOT="${D}opt/${PN}/"

	# fix plugins and libs path
	mkdir -p "${ED}/opt/${PN}/lib/${PN}" || die
	mv "${ED}"/opt/${PN}/bin/libliteapp* "${ED}/opt/${PN}/lib/${PN}/" || die
	mv "${ED}/opt/${PN}/plugins" "${ED}/opt/${PN}/lib/${PN}/" || die

	# install documentation
	local OSTARGET
	insinto /opt/${PN}/share/${PN}/
	doins -r "${S}"/liteidex/deploy/*
	use kernel_linux && OSTARGET=linux
	use kernel_FreeBSD && OSTARGET=freebsd
	[[ -n ${OSTARGET} ]] && doins -r "${S}"/liteidex/os_deploy/${OSTARGET}/*

	# liteide runtime script
	dobin "${FILESDIR}/${PN}"
	fperms 755 /usr/bin/${PN}

	# remove .la/.a files
	rm "${ED}"/opt/${PN}/lib/*.a || die
}