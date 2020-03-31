# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/justjanne"
GOLANG_PKG_ARCHIVEPREFIX="v"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mattn/go-runewidth:9e777a8" #v0.0.2
	"github.com/golang/crypto:1875d0a -> golang.org/x"
	"github.com/golang/sys:37707fd -> golang.org/x"
	"github.com/golang/text:c4d099d -> golang.org/x" #v0.2.0
	"github.com/go-yaml/yaml:d670f94 -> gopkg.in/yaml.v2"
)

inherit golang-single

DESCRIPTION="A beautiful and useful low-latency prompt for your shell"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86 arm"
