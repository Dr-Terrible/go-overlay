# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/kisielk"
GOLANG_PKG_VERSION="50ffcb6f3595daac70aff9e63afe8b8b277b1a1a"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:94d5dba"
	"github.com/golang/tools:9e74590 -> golang.org/x"
	#"github.com/golang/tools:4ad5335 -> golang.org/x" #without "go/types" API changes
)

inherit golang-single

DESCRIPTION="Errcheck checks that you checked errors"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="!dev-go/${PN}"
