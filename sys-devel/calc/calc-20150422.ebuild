# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/alfredxing"
GOLANG_PKG_VERSION="1a308a39ad3e902f5d680610c634069e4f32ea3a"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/crypto:1e856cbfdf -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A simple, fast command-line calculator written in GoLang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"