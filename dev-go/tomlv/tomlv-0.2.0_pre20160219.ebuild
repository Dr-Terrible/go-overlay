# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/BurntSushi"
GOLANG_PKG_NAME="toml"
GOLANG_PKG_VERSION="f772cd89eb0b33743387f826d1918df67f99cc7a"
GOLANG_PKG_BUILDPATH="/cmd/tomlv"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A TOML validator written in GoLang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN//v}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
