# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/motemen"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/mitchellh/go-homedir:d682a8f"
	"github.com/motemen/go-quickfix:a5d4c82"
	"github.com/peterh/liner:b850cf8"
	"github.com/golang/tools:b6b32a4 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="A REPL for Golang"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
