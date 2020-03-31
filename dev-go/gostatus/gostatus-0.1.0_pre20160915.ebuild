# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/shurcooL"
GOLANG_PKG_VERSION="09944abf978ad8c48c52dab9aba9b8681b7a69ea"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bradfitz/iter:454541e"
	"github.com/kisielk/gotool:58a7a19"
	"github.com/shurcooL/vcsstate:f2d72d2"
	"github.com/shurcooL/go:c7751eb"
	"github.com/golang/tools:b5358b5 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A command-line tool that show the status of GoLang repositories"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
