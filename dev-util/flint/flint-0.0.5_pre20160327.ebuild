# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/pengwynn"
GOLANG_PKG_VERSION="db5e1426b264f11bde11a9a09f06bf411a9735d5"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/codegangsta/cli:5db7419"
	"github.com/fatih/color:1b35f28"
	"github.com/octokit/go-octokit:f1f04f8"
	"github.com/fhs/go-netrc:4422b68"
	"github.com/jingweno/go-sawyer:1999ae5"
	"github.com/shiena/ansicolor:a422bbe"
	"github.com/jtacoma/uritemplates:802b8e2"

	# Unit Testing
	"github.com/stretchr/testify:232e856" # v1.0
)

inherit golang-single

DESCRIPTION="Check your project for common sources of contributor friction"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="!dev-go/${PN}"
