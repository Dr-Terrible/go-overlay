# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/ehazlett"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/sctl /cmd/${PN} /cmd/${PN}-cni-ipam"
GOLANG_PKG_LDFLAGS="-X github.com/ehazlett/stellar/version.Build=-gentoo -X github.com/ehazlett/stellar/version.GitCommit=eff2144"
GOLANG_PKG_HAVE_TEST=1

inherit systemd golang-single

DESCRIPTION="Simplified Container System"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
#IUSE+=" +seccomp apparmor selinux"

DEPEND="dev-libs/protobuf:0="
RDEPEND="${DEPEND}
	app-emulation/containerd
	net-misc/gnatsd"

src_install() {
	golang-single_src_install

	# Install configuration files
	insinto /etc
	insopts -m640
	doins "${FILESDIR}"/${PN}.conf

	# Install init scripts
	systemd_dounit "${FILESDIR}"/${PN}.service
}
