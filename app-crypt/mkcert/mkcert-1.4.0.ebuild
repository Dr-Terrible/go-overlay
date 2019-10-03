# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/FiloSottile/${PN}"

inherit golang-vcs-snapshot

DESCRIPTION="A simple tool for making locally-trusted development certificates"
HOMEPAGE="https://github.com/FiloSottile/mkcert"
SRC_URI="https://github.com/FiloSottile/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86" # Untested: arm arm64 x86
IUSE="debug pie static"

DOCS=( README.md )
QA_PRESTRIPPED="usr/bin/.*"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

src_compile() {
	export GOPATH="${G}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	(use static && ! use pie) && export CGO_ENABLED=0
	(use static && use pie) && CGO_LDFLAGS+=" -static"

	local mygoargs=(
		-v -work -x
		-buildmode "$(usex pie pie exe)"
		-asmflags "all=-trimpath=${S}"
		-gcflags "all=-trimpath=${S}"
		-ldflags "$(usex !debug '-s -w' '')"
		-tags "$(usex static 'netgo' '')"
		-installsuffix "$(usex static 'netgo' '')"
	)

	go build "${mygoargs[@]}" || die
}

src_install() {
	dobin mkcert
	use debug && dostrip -x /usr/bin/mkcert
	einstalldocs
}
