# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/gopherjs"
GOLANG_PKG_VERSION="d547d1d9531ed93dbdebcbff7f83e7c876a1e0ee"
GOLANG_PKG_TAGS="purego"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kardianos/osext:ae77be6"
	"github.com/fsnotify/fsnotify:629574c" #v1.4.2
	"github.com/neelance/sourcemap:8c68805"
	"github.com/spf13/cobra:7b2c5ac" #v0.0.1
	"github.com/spf13/pflag:e57e3ee" #v1.0.0
	"github.com/shurcooL/httpfs:809bece"
	"github.com/golang/crypto:94eea52 -> golang.org/x"
	"github.com/golang/tools:0444735 -> golang.org/x"
	"github.com/golang/sys:8b4580a -> golang.org/x"

	# Unit Testing
	"github.com/kisielk/gotool:d6ce626"
	"github.com/shurcooL/go:c7751eb"
)

inherit golang-single

DESCRIPTION="GopherJS compiles GoLang code to pure JavaScript code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

RESTRICT+=" test"
