# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/lukasmartinelli"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/codegangsta/cli:b5232bb"
	"github.com/streadway/amqp:f4879ba28f"
)

inherit golang-single

DESCRIPTION="Pipecat allows you to scale any program using traditional UNIX pipes and AMQP"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
