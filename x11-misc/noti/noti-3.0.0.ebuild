# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/variadico"
GOLANG_PKG_BUILDPATH="/cmd/noti"
GOLANG_PKG_LDFLAGS="-X github.com/variadico/noti/internal/command.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Display a notification when a terminal process finishes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

RDEPEND="x11-libs/libnotify
	app-accessibility/espeak"

src_install() {
	golang-single_src_install

	doman docs/man/${PN}*.{1,5}
	dodoc docs/*.md
}

src_test() {
	if has network-sandbox $FEATURES; then
		eerror "Some tests require 'network-sandbox' to be disabled in FEATURES."
	fi
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
