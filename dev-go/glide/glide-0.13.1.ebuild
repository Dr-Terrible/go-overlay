# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/Masterminds"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	# Unit Testing
	"github.com/urfave/cli:a14d7d3" #v1.18.1
	"github.com/go-check/check:4f90aea -> gopkg.in/check.v1"
)

inherit golang-single

DESCRIPTION="Glide is a vendor Package Management for Golang"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="test? ( dev-vcs/bzr )"

src_test() {
	if has usersandbox $FEATURES; then
		eerror "Tests require 'network-sandbox' to be disabled in FEATURES."
	fi

	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
