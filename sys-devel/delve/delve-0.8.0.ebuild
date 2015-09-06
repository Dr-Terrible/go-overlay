# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/derekparker"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_VERSION="${PV}-alpha"
GOLANG_PKG_BUILDPATH="/cmd/dlv"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/peterh/liner:1bb0d1c1a2"
	"github.com/golang/sys:58da1121af -> golang.org/x"
	"github.com/spf13/cobra:c55cdf3385"
	"github.com/inconshreveable/mousetrap:76626ae9c9"
	"github.com/spf13/pflag:4869ec2ae0"
	"github.com/go-yaml/yaml:c1cd2254a6 -> gopkg.in/yaml.v2"

	# Unit testing
	"github.com/davecheney/profile:c29d1a1565"
)
inherit golang-single

DESCRIPTION="Delve is a debugger for the Go programming language"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"