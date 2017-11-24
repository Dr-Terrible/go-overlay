# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/magefile"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X github.com/magefile/mage/mage.gitTag=${PV} -X github.com/magefile/mage/mage.commitHash=ab3ca2f"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A Make/rake-like build tool using Go"
HOMEPAGE="https://magefile.org"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE="doc"

DEPEND="doc? ( www-apps/hugo )"

src_install() {
	golang-single_src_install

	# Install documentation
	if use doc; then
		pushd site > /dev/null || die
			hugo \
				-d "${T}"/docs \
				--baseURL="file:///usr/share/doc/${PF}/html/" \
				--canonifyURLs=true \
				--uglyURLs=true \
				--disableKinds=404 \
				--disableKinds=RSS \
				--disableKinds=sitemap \
				--noTimes=true \
				--enableGitInfo=false \
				--verbose \
				|| die
			docinto html
			dodoc -r "${T}"/docs/*
		popd > /dev/null || die
	fi
}

src_test() {
	if has sandbox $FEATURES && has network-sandbox $FEATURES; then
		eerror "Some tests require 'sandbox', and 'network-sandbox' to be disabled in FEATURES."
	fi

	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
