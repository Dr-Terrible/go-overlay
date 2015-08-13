# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/gopherjs"
GOLANG_PKG_VERSION="e0189ad6cb0a75ca87915b04c21f21af8a3a483d"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/kardianos/osext:6e7f843663"
	"github.com/neelance/sourcemap:8994456d80"
	"github.com/spf13/cobra:312092086b"
	"github.com/spf13/pflag:5644820622"
	"github.com/golang/crypto:1e856cbfdf -> golang.org/x"
	"github.com/golang/tools:4f50f44d7a -> golang.org/x"
	"github.com/go-fsnotify/fsnotify:96c060f6a6 -> gopkg.in/fsnotify.v1"
	"github.com/inconshreveable/mousetrap:76626ae9c9"
)

inherit golang-single

DESCRIPTION="GopherJS compils GoLang code to pure JavaScript code"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
