# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/jfrazelle"
GOLANG_PKG_VERSION="85e750a290ebcf3167d77cc9b4a0334d400e5cf8"

#GOLANG_PKG_DEPENDENCIES=(
#	"github.com/Sirupsen/logrus:4b6ea73" # v0.10.0
#	"github.com/atotto/clipboard:bb272b8"
#	"github.com/codegangsta/cli:f9cc300"
#	"github.com/docker/docker:23cf638 -> github.com/dotcloud" # v1.12.1
#	"github.com/golang/crypto:81372b2 -> golang.org/x"
#	"github.com/opencontainers/runc:baf6536" #v0.1.1
#)

inherit golang-single

DESCRIPTION="Local File-Based Password, API Key, Secret, Recovery Code Store Backed vy GPG"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"

RDEPEND="|| ( x11-misc/xsel x11-misc/xclip )"
