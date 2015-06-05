# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit multiprocessing qt4-r2

LITEIDE_EGIT_COMMIT="ecc29db34c9420f4ad79739c241cdb4b8f2cab8b"

# liteide tools dep
LITOOLS_EGIT_COMMIT="07fb242eb9ee0950a31ff3d809c1faa5c3b2a5f6"
LITOOLS_PN="github.com/visualfc/gotools"

# goland tools dep
GOTOOLS_EGIT_COMMIT="a18bb1d557dac8d19062dd0240b44ab09cfa14fd"
GOTOOLS_PN="golang.org/x/tools"

# gocode dep
GOCODE_PN="github.com/nsf/gocode"

DESCRIPTION="LiteIDE is a simple, open source, cross-platform Go IDE."
HOMEPAGE="http://code.google.com/p/liteide"
SRC_URI="https://github.com/visualfc/${PN}/archive/${LITEIDE_EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://${LITOOLS_PN}/archive/${LITOOLS_EGIT_COMMIT}.tar.gz -> ${PN}-tools-${PV}.tar.gz
	https://github.com/golang/tools/archive/${GOTOOLS_EGIT_COMMIT}.tar.gz -> golang-tools-${PV}.tar.gz
	https://${GOCODE_PN}/archive/v.20150303.tar.gz -> gocode-20150303.tar.gz"

LICENSE="LGPL-2.1"
KEYWORDS="-* ~amd64 ~x86 ~amd64-fbsd ~x86-fbsd "
SLOT="0"
IUSE="debug gdb kernel_linux kernel_FreeBSD test"

DEPEND="dev-lang/go
	dev-qt/qtgui:4
	dev-qt/qtwebkit:4"
RDEPEND="${DEPEND}
	gdb? ( sys-devel/gdb )"

S="${WORKDIR}/${PN}-${LITEIDE_EGIT_COMMIT}"

# define local GOPATH/GOBIN
GOPATH="${WORKDIR}/gopath"
GOBIN="${S}/liteidex/liteide/bin/"

RESTRICT="mirror"

DOCS=(
	"${S}"/liteidex/LICENSE.LGPL
	"${S}"/liteidex/LGPL_EXCEPTION.TXT
	"${S}"/README.md
	"${S}"/CONTRIBUTORS
)

src_unpack() {
	default_src_unpack

	# prepare liteide tools
	mkdir -p "${GOPATH}"/src/${LITOOLS_PN%/*} || die
	mv gotools-${LITOOLS_EGIT_COMMIT} "${GOPATH}"/src/${LITOOLS_PN%/*}/gotools || die

	# prepare golang tools
	mkdir -p "${GOPATH}"/src/${GOTOOLS_PN%/*} || die
	mv tools-${GOTOOLS_EGIT_COMMIT} "${GOPATH}"/src/${GOTOOLS_PN%/*}/tools || die

	# prepare gocode
	mkdir -p "${GOPATH}"/src/${GOCODE_PN%/*} || die
	mv gocode-v.20150303 "${GOPATH}"/src/${GOCODE_PN%/*}/gocode || die
}

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

	# set GOPATH
	export GOPATH="${GOPATH}"
	einfo "GOPATH: ${GOPATH}"

	# compile liteide tools
	go build -v -a -p $(makeopts_jobs) \
		-o "${GOBIN}"/gotools ${LITOOLS_PN} || die

	# compile gocode
	go build -v -a -p $(makeopts_jobs) \
		-o "${GOBIN}"gocode ${GOCODE_PN} || die
}

src_install() {
	# install liteide
	cd "${S}"/liteidex/ || die
	qt4-r2_src_install DESTDIR="${D}opt/${PN}/" INSTALL_ROOT="${D}opt/${PN}/"

	# install liteide tools
	exeinto /opt/${PN}/bin
	doexe "${GOBIN}"/go*

	# fix plugins path
	mkdir -p "${ED}"/opt/"${PN}"/lib/"${PN}" || die
	mv "${ED}"/opt/"${PN}"/plugins "${ED}"/opt/"${PN}"/lib/"${PN}" || die

	# install documentation
	local OSTARGET
	insinto /opt/${PN}/share/${PN}/
	doins -r "${S}"/liteidex/deploy/*
	use kernel_linux && OSTARGET=linux
	use kernel_FreeBSD && OSTARGET=freebsd
	[[ -n ${OSTARGET} ]] && doins -r "${S}"/liteidex/os_deploy/${OSTARGET}/*

	# remove .la/.a files
	rm "${ED}"/opt/"${PN}"/lib/*.a || die
}

src_test() {
	# test liteide tools
	go test ${LITOOLS_PN} || die

	# test gocode
	go test ${GOCODE_PN} || die
}