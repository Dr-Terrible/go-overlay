# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/josharian"
GOLANG_PKG_VERSION="43306ba79c4e3d1a038db0365b189ad4cca413c6"
GOLANG_PKG_HAVE_TEST=0

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:3fe2afc -> golang.org/x"
)

inherit golang-single

DESCRIPTION="impl generates method stubs for implementing an interface"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RDEPEND=">=dev-lang/go-1.7.0"
