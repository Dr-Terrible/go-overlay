# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/limetext"
GOLANG_PKG_VERSION="9be3dfbf330f6ca1f101a1b33f43fdf4b61bbac6"
GOLANG_PKG_BUILDPATH="/main"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/limetext/lime-backend:57d076bbb9"
	"github.com/atotto/clipboard:dfde2702d6"
	"github.com/limetext/log4go:2aba105a60"
	"github.com/limetext/rubex:3fc130e580"
	"github.com/limetext/text:d6b8f8c60f"
	"github.com/limetext/gopy:92b1bf5ab8"
	"github.com/quarnster/parser:ea90feb37b"
	"github.com/go-fsnotify/fsnotify:96c060f6a6 -> gopkg.in/fsnotify.v1"
	"github.com/go-fsnotify/fsnotify:ea925a0a47 -> gopkg.in/fsnotify.v0"
	"github.com/go-qml/qml:2ee7e5ff73 -> gopkg.in/qml.v1"
)

inherit git-r3 golang-single

GOLANG_PKG_VENDOR=(
	"${S}/packages/GoSublime/"
)

EGIT_REPO_URI="git://github.com/limetext/lime-packages"
EGIT_COMMIT="4fffef018f"
EGIT_CHECKOUT_DIR="${S}/packages/"

DESCRIPTION="QML frontend for Lime text editor."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"

DEPEND="dev-lang/python:3.4
	dev-libs/oniguruma:0
	dev-qt/qtdeclarative:5[widgets]
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5"

RDEPEND="${DEPEND}"

src_unpack() {
	golang-single_src_unpack

	# third-party dependencies
	git-r3_src_unpack
}
