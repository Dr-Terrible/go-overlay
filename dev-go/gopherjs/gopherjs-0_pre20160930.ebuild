# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/gopherjs"
GOLANG_PKG_VERSION="00f306e07eaaaab04ea5dba605cd0e1eff9c6fb7"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kardianos/osext:c2c54e5"
	"github.com/fsnotify/fsnotify:944cff2" #v1.4.1
	"github.com/neelance/sourcemap:8c68805"
	"github.com/spf13/cobra:9c28e4b"
	"github.com/spf13/pflag:b83537d"
	"github.com/golang/crypto:d172538 -> golang.org/x"
	"github.com/golang/tools:b5358b5 -> golang.org/x"
	"github.com/golang/sys:8d1157a -> golang.org/x"

	# Unit Testing
	"github.com/kisielk/gotool:94d5dba"
	"github.com/shurcooL/go:c7751eb"
)

inherit golang-single

DESCRIPTION="GopherJS compils GoLang code to pure JavaScript code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
