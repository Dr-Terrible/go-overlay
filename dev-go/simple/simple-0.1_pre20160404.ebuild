# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/dominikh"
GOLANG_PKG_VERSION="fc501be92c4a32446cf2429d0ff2d29fcdbfe661"
GOLANG_PKG_NAME="go-${PN}"
GOLANG_PKG_BUILDPATH="/cmd/go${PN}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/dominikh/go-lint:104a558"
	"github.com/golang/tools:fe1488f -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Gosimple is a linter for Go source code that specialises on simplifying code"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_prepare() {
	golang-single_src_prepare

	sed -i \
		-e "s:honnef.co\/go\/simple:honnef.co\/go\/go-simple:" \
		-e "s:honnef.co\/go:github.com\/dominikh:" \
		lint.go \
		lint_test.go \
		cmd/gosimple/gosimple.go \
		../go-lint/lint.go \
		../go-lint/lintutil/util.go \
		../go-lint/testutil/util.go \
		|| die

	golang_fix_importpath_alias \
		"${GOLANG_PKG_IMPORTPATH}/go-lint" \
		"${GOLANG_PKG_IMPORTPATH}/lint"
}
