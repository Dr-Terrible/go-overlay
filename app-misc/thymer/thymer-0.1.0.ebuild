# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/blang"
GOLANG_PKG_VERSION="6cdeacfcf8a36f85808b25f29f3afb3e376719ac"

inherit golang-single

DESCRIPTION="Consolo Pomodoro Timer written in GoLang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"