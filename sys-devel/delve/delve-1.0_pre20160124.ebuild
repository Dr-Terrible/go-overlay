# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/derekparker"
GOLANG_PKG_VERSION="1bda586115ad3ca0daa6f5b7180a6bc662c72685"
GOLANG_PKG_BUILDPATH="/cmd/dlv"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

# Declare dependencies
#GOLANG_PKG_DEPENDENCIES=(
#	"github.com/peterh/liner:b850cf8"
#	"github.com/golang/sys:354f231 -> golang.org/x"
#	"github.com/spf13/cobra:8b2293c"
#	"github.com/spf13/pflag:08b1a58"
#	"github.com/inconshreveable/mousetrap:76626ae9c9"
#	"github.com/go-yaml/yaml:53feefa -> gopkg.in/yaml.v2"
#	"github.com/cpuguy83/go-md2man:71acacd" #v1.0.4
#	"github.com/russross/blackfriday:8cec3a854e" #v1.3
#	"github.com/shurcooL/sanitized_anchor_name:244f5ac"
#
#	# Unit testing
#	"github.com/davecheney/profile:c29d1a1565"
#)
inherit golang-single

DESCRIPTION="Delve is a debugger for the Go programming language"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/go-1.5.3"
