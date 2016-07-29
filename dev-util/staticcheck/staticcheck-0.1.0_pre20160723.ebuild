# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="honnef.co/go"
GOLANG_PKG_VERSION="4e4406f161a1bf5c12e243190843989e462fa07b"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/kisielk/gotool:94d5dba"
	"github.com/golang/tools:9e74590 -> golang.org/x"
	"github.com/dominikh/go-lint:a730e73 -> honnef.co/go"
)

# (Ugly hack) Must be declared before the inherit since we're
# tinkering with a custom src_unpack() function.
SRC_URI="https://github.com/dominikh/go-${PN}/archive/${GOLANG_PKG_ARCHIVEPREFIX}${GOLANG_PKG_VERSION}.tar.gz -> ${P}.tar.gz"

inherit golang-single

DESCRIPTION="A Golang tool for statically checking the inputs to certain functions"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_unpack() {
	# Ugly hack to circumvent 'github.com/dominikh/go-staticcheck' as
	# an unusual alias for 'honnef.co/go/staticcheck'.
	local GOLANG_PKG_NAME="go-${PN}"
	golang-single_src_unpack
}

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"${GOLANG_PKG_IMPORTPATH}/go-lint" \
		"${GOLANG_PKG_IMPORTPATH}/lint"
}
