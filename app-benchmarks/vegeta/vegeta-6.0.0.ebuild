# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/tsenart"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.Version=v${PV}"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bmizerany/perks:d9a9656a3a"
	"github.com/streadway/quantile:b0c5887"
)

inherit golang-single

DESCRIPTION="HTTP load testing tool and library written in GoLang."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
