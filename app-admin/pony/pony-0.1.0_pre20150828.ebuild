# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/jfrazelle"
GOLANG_PKG_VERSION="af449a86c631cdc795e80b089d620a4f685d2d52"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/Sirupsen/logrus:5701be89e7" # logrus v0.8.6
	"github.com/atotto/clipboard:dfde2702d6"
	"github.com/codegangsta/cli:142e6cd241"
	"github.com/docker/docker:0a8c2e3717 -> github.com/dotcloud" # v1.8.2
	"github.com/golang/crypto:1e856cbfdf -> golang.org/x"
	"github.com/opencontainers/runc:b0fd9fb75a"
)

inherit golang-single

DESCRIPTION="Local File-Based Password, API Key, Secret, Recovery Code Store Backed vy GPG"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RDEPEND="|| ( x11-misc/xsel x11-misc/xclip )"