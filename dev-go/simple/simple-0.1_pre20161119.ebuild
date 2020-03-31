# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="honnef.co/go"
GOLANG_PKG_VERSION="785f2adbeecfb675c110966bb69792863aa0aa49"
GOLANG_PKG_BUILDPATH="/cmd/go${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:0de1eaf"
	"github.com/dominikh/go-lint:3cb61f0 -> honnef.co/go"
	"github.com/dominikh/go-ssa:1cf7f34 -> honnef.co/go"
	"github.com/golang/tools:354f9f8 -> golang.org/x"
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.com/dominikh/go-${PN}/archive/${GOLANG_PKG_ARCHIVEPREFIX}${GOLANG_PKG_VERSION}.tar.gz -> ${P}.tar.gz"

inherit golang-single

DESCRIPTION="Gosimple is a linter for Go source code that specialises on simplifying code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_unpack() {
	# Ugly hack to circumvent 'github.com/dominikh/go-simple' as
	# an unusual alias for 'honnef.co/go/staticcheck'.
	local GOLANG_PKG_NAME="go-${PN}"
	golang-single_src_unpack
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"${GOLANG_PKG_IMPORTPATH}/go-lint" \
		"${GOLANG_PKG_IMPORTPATH}/lint"

	golang_fix_importpath_alias \
		"${GOLANG_PKG_IMPORTPATH}/go-ssa" \
		"${GOLANG_PKG_IMPORTPATH}/ssa"
}
