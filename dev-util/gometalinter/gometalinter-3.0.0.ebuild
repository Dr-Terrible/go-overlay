# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/alecthomas"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	# Unit Testing
	"github.com/stretchr/testify:3ebf1dd" #v1.5.1
)

inherit golang-single

DESCRIPTION="Concurrently run Go lint tools and normalise their output"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

# NOTE: All these blocked packages have been moved into dev-util/go-tools
DEPEND="!dev-go/structlayout
	!dev-go/unused
	!dev-util/staticcheck"

RDEPEND="
	dev-go/go-tools
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
	dev-util/gosec
	dev-util/go-tools
	dev-util/misspell
	dev-util/nakedret
	dev-util/unparam
	dev-util/maligned
	dev-go/safesql
"
