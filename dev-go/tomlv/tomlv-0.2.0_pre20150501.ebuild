# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/BurntSushi"
GOLANG_PKG_NAME="toml"
GOLANG_PKG_VERSION="056c9bc7be7190eaa7715723883caffa5f8fa3e4"
GOLANG_PKG_BUILDPATH="/cmd/tomlv"
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A TOML validator written in GoLang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"