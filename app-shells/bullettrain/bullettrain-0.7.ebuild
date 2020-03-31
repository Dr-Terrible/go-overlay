# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/bullettrain-sh"
GOLANG_PKG_NAME="${PN}-go-core"
GOLANG_PKG_ARCHIVEPREFIX="v"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/bullettrain-sh/bullettrain-go-git:8032056"     #v0.7
	"github.com/bullettrain-sh/bullettrain-go-golang:b9a4b1d"  #v0.7
	"github.com/bullettrain-sh/bullettrain-go-nodejs:86d0bfd"  #v0.7
	"github.com/bullettrain-sh/bullettrain-go-php:bc78684"     #v0.7
	"github.com/bullettrain-sh/bullettrain-go-python:13d79e7"  #v0.7
	"github.com/bullettrain-sh/bullettrain-go-ruby:c7388d5"    #v0.7
)

inherit golang-single

DESCRIPTION="Bullet Train is a ZSH & BASH prompt theme inspired by the Powerline Vim plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DOCS="docs/* README.md"
