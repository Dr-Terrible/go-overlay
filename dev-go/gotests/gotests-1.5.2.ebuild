# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/cweill"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:b5358b5 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="It's a Golang commandline tool that generates table driven tests"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND="dev-go/go-bindata"
