# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/onsi"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(

	# unit testing
	"github.com/onsi/gomega:d6c945f9fd"
)

inherit golang-single

DESCRIPTION="BDD Testing Framework for GoLang"
HOMEPAGE="http://onsi.github.io/ginkgo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="test? ( dev-go/go-tools )"
