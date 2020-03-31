# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/HouzuoGuo"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/dgrijalva/jwt-go:d2709f9" #v3.0.0
)

inherit systemd golang-single

DESCRIPTION="Tiedot is a document-oriented NoSQL database written in GoLang"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="net-misc/curl"

DOCS=(
	"${S}/doc/API-reference-and-embedded-usage.md"
	"${S}/doc/Concurrency-and-networking.md"
	"${S}/doc/Data-structures.md"
	"${S}/doc/Home.md"
	"${S}/doc/Limitations.md"
	"${S}/doc/Performance-tuning-and-benchmarks.md"
	"${S}/doc/Query-processor-and-index.md"
	"${S}/doc/Tutorial.md"
	"${S}/doc/Version-History.md"
)

src_install() {
	golang-single_src_install

	# Install init scripts
	systemd_dounit "${S}"/distributable/${PN}.service

	insinto /etc
	doins "${S}"/distributable/etc/${PN}
}
