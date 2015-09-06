# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/Masterminds"
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/Masterminds/cookoo:623f8762b2"
	"github.com/Masterminds/vcs:5eb2d6a132"
	"github.com/codegangsta/cli:142e6cd241"
	"github.com/kylelemons/go-gypsy:42fc2c7ee9"
)

inherit golang-single

DESCRIPTION="Glide is a simplified GoLang project management, dependency management, and vendoring"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_test() {
	if has sandbox $FEATURES && has usersandbox $FEATURES; then
		eerror "Tests require sandbox, and usersandbox to be disabled in FEATURES."
	fi

	golang-single_src_test
}