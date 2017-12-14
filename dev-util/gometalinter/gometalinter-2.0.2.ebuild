# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/alecthomas"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	# Unit Testing
	"github.com/stretchr/testify:69483b4"              #v1.1.4
)

inherit golang-single

DESCRIPTION="Concurrently run Go lint tools and normalise their output"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

# NOTE: All these blocked packages have been moved into dev-util/go-tools
DEPEND="!dev-go/structlayout
	!dev-go/unused
	!dev-util/staticcheck"

RDEPEND="dev-go/go-tools
	dev-util/deadcode
	dev-util/gocyclo
	dev-util/golint
	dev-util/check
	dev-util/errcheck
	dev-util/dupl
	dev-util/ineffassign
	dev-util/interfacer
	dev-util/unconvert
	dev-util/lll
	dev-util/goconst
	dev-util/gas
	dev-util/go-tools
	dev-util/misspell
	dev-util/nakedret
	dev-util/unparam
	dev-util/maligned
	dev-go/safesql"
