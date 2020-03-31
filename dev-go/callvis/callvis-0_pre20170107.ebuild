# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/TrueFurby"
GOLANG_PKG_NAME="go-${PN}"
GOLANG_PKG_OUTPUT_NAME="${GOLANG_PKG_NAME}"
GOLANG_PKG_VERSION="92ac27f4f32e3dd3c47df8ad47282510e63ae0a3"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/golang/tools:8b89e95 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Visualize call graph of your Go program using dot format"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
