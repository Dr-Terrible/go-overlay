# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/gravitational"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/tool/${PN} /tool/tctl /tool/tsh"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/aws/aws-sdk-go:36670f6" #v1.6.9
)

PYTHON_COMPAT=( python2_7 python3_{4,5} )
inherit python-any-r1 golang-single systemd

DESCRIPTION="Modern SSH server for clusters and teams"
HOMEPAGE="http://gravitational.com/teleport"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 -*"
IUSE+=" doc dynamodb"

DEPEND="app-arch/zip
	doc? (
		dev-python/mkdocs
		dev-python/backports-abc
		dev-python/markdown-include
	)"

pkg_setup() {
	use doc && python-any-r1_pkg_setup
}

src_prepare() {
	golang-single_src_prepare

	# Fix binary path
	sed -i \
		-e "s:/usr/local/bin:/usr/bin:" \
		examples/systemd/${PN}.service || die
}
src_compile() {
	use dynamodb && GOLANG_PKG_TAGS+=" dynamodb"
	golang-single_src_compile

	# Concat web assets to teleport binary
	pushd web/dist > /dev/null || die
		local BUILDDIR="${T}/build"
		mkdir -p "${BUILDDIR}" || die

		einfo "Generating web assets"
		zip -qr "${BUILDDIR}"/webassets.zip . || die
		cat "${BUILDDIR}"/webassets.zip >> "${GOBIN}"/teleport || die
		zip -q -A "${GOBIN}"/teleport || die
	popd > /dev/null || die
}

src_install() {
	golang-single_src_install

	# Install config file
	insinto /etc
	touch "${T}"/${PN}.yaml || die
	doins "${T}"/${PN}.yaml

	# Install init scripts
	systemd_dounit examples/systemd/${PN}.service

	if use doc; then
		einfo "Building documentations"
		mkdocs build -c -f mkdocs.yml || die

		rm -r build/docs/{*.py,__pycache__,theme/__init__.py} || die
		docinto html
		dodoc -r build/docs/*
	fi
}
