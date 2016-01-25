# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/jfrazelle"
GOLANG_PKG_VERSION="2d84d26ade1760c63cc58c7c71b0fd46de430caf"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/Sirupsen/logrus:f7f79f7"
	"github.com/atotto/clipboard:d35a4e4"
	"github.com/codegangsta/cli:f9cc300"
	"github.com/docker/docker:a34a1d5 -> github.com/dotcloud" # v1.9.1
	"github.com/golang/crypto:3760e01 -> golang.org/x"
	"github.com/opencontainers/runc:cb04f03" #v.0.0.6
)

inherit golang-single

DESCRIPTION="Local File-Based Password, API Key, Secret, Recovery Code Store Backed vy GPG"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RDEPEND="|| ( x11-misc/xsel x11-misc/xclip )"
