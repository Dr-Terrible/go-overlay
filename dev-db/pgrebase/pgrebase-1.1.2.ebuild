# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/oelmekki"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/fsnotify/fsnotify:629574c" #v1.4.2
	"github.com/lib/pq:8df6253"
	"github.com/golang/sys:d75a526 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="PGRebase handles your postgres codebase for functions, triggers and views"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
