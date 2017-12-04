# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/gopherjs"
GOLANG_PKG_VERSION="444abdf920945de5d4a977b572bcc6c674d1e4eb"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kardianos/osext:ae77be6"
	"github.com/fsnotify/fsnotify:629574c" #v1.4.2
	"github.com/neelance/sourcemap:8c68805"
	"github.com/spf13/cobra:7b2c5ac" #v0.0.1
	"github.com/spf13/pflag:e57e3ee" #v1.0.0
	"github.com/golang/crypto:94eea52 -> golang.org/x"
	"github.com/golang/tools:0444735 -> golang.org/x"
	"github.com/golang/sys:8b4580a -> golang.org/x"

	# Unit Testing
	"github.com/kisielk/gotool:d6ce626"
	"github.com/shurcooL/go:c7751eb"
)

inherit golang-single

DESCRIPTION="GopherJS compils GoLang code to pure JavaScript code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
