# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/getantibody"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/caarlos0/gohome:cbed4b2"
	"github.com/kardianos/osext:c2c54e5"
	"github.com/urfave/cli:a14d7d3" #v1.18.1
	"github.com/golang/crypto:81372b2 -> golang.org/x"
	"github.com/golang/sync:316e794 -> golang.org/x"
	"github.com/golang/net:6d3beae -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A faster and simpler antigen written in Golang"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

RDEPEND="app-shells/zsh[unicode]
	dev-vcs/git"

RESTRICT+=" test"
