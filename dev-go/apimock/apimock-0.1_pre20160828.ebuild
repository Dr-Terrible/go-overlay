# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/pierreprinetti"
GOLANG_PKG_VERSION="afe99636b63c7e7788292bc7d98fb5ff417daca7"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/codegangsta/negroni:fde5e16" #v0.2.0
	"github.com/gorilla/mux:0eeaf83"         #v1.1
	"github.com/gorilla/context:1ea2538"     #v1.1
)

inherit golang-single

DESCRIPTION="A mock API server"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
