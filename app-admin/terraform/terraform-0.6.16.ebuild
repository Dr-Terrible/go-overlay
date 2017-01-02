# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/hashicorp"
GOLANG_PKG_ARCHIVEPREFIX="v"
#GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Terraform builds, changes, and combines infrastructure safely and efficiently"
HOMEPAGE="http://www.terraform.io"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

COMMON_IUSE="chef"
IUSE_PROVIDERS="atlas aws azure azurerm cloudflare cloudstack consul digitalocean dme dnsimple docker dyn google heroku librato mailgun +null openstack packet rundeck softlayer statuscake +template +tls vsphere vcd postgresql mysql powerdns"
IUSE_PROVISIONERS="+file +local-exec +remote-exec"
IUSE+=" $IUSE_PROVIDERS $IUSE_PROVISIONERS $COMMON_IUSE"

# go-tools and codecgen are required by "go:generate stringer" directive
#DEPEND="dev-go/go-tools
#	dev-go/codecgen"

src_compile() {
	# build terraform binary
	golang-single_src_compile

	# build providers binaries
	GOLANG_PKG_BUILDPATH+=" /builtin/bins/provider-${PN}"
	local PROVIDERS="${IUSE_PROVIDERS} ${COMMON_IUSE}"
	for provider in ${PROVIDERS}; do
		provider="${provider//\+/}"
		eval use ${provider} || continue

		einfo "Building provider: ${provider}"
		GOLANG_PKG_BUILDPATH+=" /builtin/bins/provider-${provider}"
	done

	# build provisioner binaries
	local PROVISIONERS="${IUSE_PROVISIONERS} ${COMMON_IUSE}"
	for provisioner in ${PROVISIONERS}; do
		provisioner="${provisioner//\+/}"
		eval use ${provisioner} || continue

		einfo "Building provisioner: ${provisioner}"
		GOLANG_PKG_BUILDPATH+=" /builtin/bins/provisioner-${provisioner}"
	done
	golang-single_src_compile
}

src_install() {
	golang-single_src_install

	# prefixing all the binaries
	for pkg in "${ED}"/usr/bin/*; do
		[[ "${PN}" == ${pkg##*/} ]] && continue
		mv "${pkg}" "${ED}"/usr/bin/${PN}-${pkg##*/} || die
	done
}
