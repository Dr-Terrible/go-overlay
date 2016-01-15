# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/kisielk"
GOLANG_PKG_VERSION="1cd10f9f7824cdbedd5175a6cea0da9763bbeece"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:58a7a19"
	"github.com/golang/tools:4ad5335 -> golang.org/x" #without "go/types" API changes
)

inherit golang-single

DESCRIPTION="Errcheck checks that you checked errors"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND=">=dev-lang/go-1.5.1
	!dev-go/${PN}"
