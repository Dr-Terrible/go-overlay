# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/google/btree:0c3044b"
	"github.com/jessevdk/go-flags:8bc97d6"
	"github.com/mattn/go-runewidth:737072b"
	"github.com/nsf/termbox-go:abe82ce"
	"github.com/lestrrat/go-pdebug:2e6eaaa"
	"github.com/pkg/errors:248dadf"
	"github.com/golang/net:71a0359 -> golang.org/x"

	# Unit Testing
	"github.com/stretchr/testify:12b6f73" #v1.2.1
)

inherit golang-single

DESCRIPTION="Simplistic interactive filtering tool"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_test(){
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
