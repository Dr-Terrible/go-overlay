# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/gopherjs"
GOLANG_PKG_VERSION="4b53e1bddba0e2f734514aeb6c02db652f4c6fe8"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/kardianos/osext:29ae4ff"
	"github.com/neelance/sourcemap:8c68805"
	"github.com/spf13/cobra:8e91712"
	"github.com/spf13/pflag:7f60f83"
	"github.com/golang/crypto:1f22c01 -> golang.org/x"
	"github.com/golang/tools:b47dfd9 -> golang.org/x"
	"github.com/go-fsnotify/fsnotify:8611c35 -> gopkg.in/fsnotify.v1" # v1.2.9
	"github.com/inconshreveable/mousetrap:76626ae"
)

inherit golang-single

DESCRIPTION="GopherJS compils GoLang code to pure JavaScript code"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND=">=dev-lang/go-1.5.0"
