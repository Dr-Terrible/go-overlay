# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/ahmetalpbalkan"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/stretchr/testify:f390dcf" #1.1.3
)

inherit golang-single

DESCRIPTION="\"go build\" wrapper to add version info to Golang applications"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
