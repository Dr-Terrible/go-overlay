# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/getantibody"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/getantibody/folder:479aa91" #v1.0.0
	"github.com/caarlos0/gohome:321f486"
	"github.com/kardianos/osext:c2c54e5"
	"github.com/urfave/cli:0bdedde" #v1.19.1
	"github.com/golang/crypto:f6b343c -> golang.org/x"
	"github.com/golang/sync:450f422 -> golang.org/x"
	"github.com/golang/net:69d4b8a -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A faster and simpler antigen written in Golang"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"

RDEPEND="app-shells/zsh[unicode]
	dev-vcs/git"

RESTRICT+=" test"
