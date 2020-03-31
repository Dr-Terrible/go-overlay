# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/hybridgroup"
GOLANG_PKG_IMPORTPATH_ALIAS="gobot.io/x"
GOLANG_PKG_BUILDPATH="/cli"
GOLANG_PKG_ARCHIVEPREFIX="v"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/codegangsta/cli:cfb3883" #v1.20.0
	"github.com/hashicorp/go-multierror:83588e7"
)

inherit golang-single

DESCRIPTION="Go framework for robotics, drones, and the Internet of Things (IoT)"
HOMEPAGE="https://gobot.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RESTRICT+=" test"
