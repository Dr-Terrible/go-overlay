# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/limetext"
GOLANG_PKG_VERSION="30af493eccd4f13442a5f22bdf87b0bf1787430b"
GOLANG_PKG_BUILDPATH="/main"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/limetext/lime-backend:57d076bbb9"
	"github.com/limetext/termbox-go:4eff9880a7"
	"github.com/atotto/clipboard:dfde2702d6"
	"github.com/limetext/log4go:2aba105a60"
	"github.com/limetext/rubex:3fc130e580"
	"github.com/limetext/text:d6b8f8c60f"
	"github.com/limetext/gopy:92b1bf5ab8"
	"github.com/quarnster/parser:ea90feb37b"
	"github.com/go-fsnotify/fsnotify:96c060f6a6 -> gopkg.in/fsnotify.v1"
	"github.com/mattn/go-runewidth:5890272cd4"
)

inherit git-r3 golang-single

GOLANG_PKG_VENDOR=(
	"${S}/packages/GoSublime/"
)

EGIT_REPO_URI="git://github.com/limetext/lime-packages"
EGIT_COMMIT="4fffef018f"
EGIT_CHECKOUT_DIR="${S}/packages/"

DESCRIPTION="Termbox frontend for Lime text editor."

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_unpack() {
	golang-single_src_unpack

	# third-party dependencies
	git-r3_src_unpack
}
