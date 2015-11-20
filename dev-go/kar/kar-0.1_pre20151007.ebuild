# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/omeid"
GOLANG_PKG_VERSION="529ce46c548ef50018da6a07ae866a2717c0fa4f"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/omeid/gonzo:10af7dd"
	"github.com/Sirupsen/logrus:418b41d" #v0.8.7
	"github.com/golang/net:4a71d18255 -> golang.org/x"

	# unit testing
	"github.com/omeid/kargar:b37bb10"
)

inherit golang-single

DESCRIPTION="Kar is a simple utility that helps you run Kargar builds from CLI"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
