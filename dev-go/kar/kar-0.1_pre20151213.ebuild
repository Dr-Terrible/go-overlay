# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/omeid"
GOLANG_PKG_VERSION="337e4a1033160f551977f2525ca37a2e5ed2e189"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/omeid/gonzo:baa2ef8"
	"github.com/Sirupsen/logrus:418b41d" #v0.8.7
	"github.com/golang/net:2e9cee7 -> golang.org/x"

	# unit testing
	"github.com/omeid/kargar:b37bb10"
)

inherit golang-single

DESCRIPTION="Kar is a simple utility that helps you run Kargar builds from CLI"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
