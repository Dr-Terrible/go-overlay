# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/jfrazelle"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/mitchellh/colorstring:8631ce9"

	# Unit Testing
	"github.com/Sirupsen/logrus:219c8cb"
)

inherit golang-single

DESCRIPTION="Weather via the command line."

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
