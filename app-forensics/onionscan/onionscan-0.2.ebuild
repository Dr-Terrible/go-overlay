# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/s-rah"
GOLANG_PKG_ARCHIVEPREFIX="OnionScan-"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/HouzuoGuo/tiedot:934ac51" #v3.3
	"github.com/rwcarlsen/goexif:709fab3"
	"github.com/golang/crypto:b2fa06b -> golang.org/x"
	"github.com/golang/net:4cfeeeb -> golang.org/x"
)

inherit golang-single

DESCRIPTION="a free and open source tool for investigating the Dark Web"
HOMEPAGE="http://onionscan.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_unpack() {
	default

	# Creates S.
	mkdir -p "${S%/*}" || die
	mv "${GOLANG_PKG_NAME}-${GOLANG_PKG_ARCHIVEPREFIX}${GOLANG_PKG_VERSION}" "${S}"/ || die
}

src_install() {
	golang-single_src_install

	dodoc -r doc/*
}
