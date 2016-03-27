# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/DanielKrawisz"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_GENERATE=1

inherit git-r3 golang-live

DESCRIPTION="bmd is a collection of Bitmessage tools inspired by btcsuite"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""

src_unpack() {
	golang-live_src_unpack

	if use test; then
		golang-live_src_fetch github.com/DanielKrawisz/mocknet
		#golang-live_src_fetch github.com/ishbir/bmutil
	fi

	# Ugly hack to get bmutil from github.com/ishbit
	# instead of github.com/monetas (which doesn't exist any more).
	BMUTIL_SRC="github.com/ishbir/bmutil"
	EGIT_REPO_URI="https://${BMUTIL_SRC}"
	EGIT_CLONE_TYPE="shallow"
	EGIT_CHECKOUT_DIR="${WORKDIR}/gopath/src/${BMUTIL_SRC}"
	git-r3_src_unpack
}

src_prepare() {
	golang-live_src_prepare

	golang_fix_importpath_alias \
		"github.com/ishbir/bmutil" \
		"github.com/monetas/bmutil"
}
