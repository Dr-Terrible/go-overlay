# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/limetext"

#
declare -A GOLANG_PKG_DEPENDENCIES=(
	[golang-tools]="golang.org/x/tools:v.20150303"
	[gotools]="github.com/visualfc/gotools:07fb242eb9ee0950a31ff3d809c1faa5c3b2a5f6"
	[gocode]="github.com/nsf/gocode:a18bb1d557dac8d19062dd0240b44ab09cfa14fd"
)

inherit golang-single

DESCRIPTION="(riscrivere) A reimplementation of Sublime Text in Go lang."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go"
RDEPEND="${DEPEND}"

RESTRICT="mirror fetch"

S="${WORKDIR}/gnugo-3.9.1"

src_compile() {
	# set GOPATH
	export GOPATH="${GOPATH}"
	einfo "GOPATH: ${GOPATH}"

	# compile lime
	go build -v -a -p $(makeopts_jobs) \
		-o "${GOBIN}"/lime ${LITOOLS_PN} || die
}