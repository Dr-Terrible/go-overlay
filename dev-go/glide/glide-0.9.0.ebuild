# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/Masterminds"
GOLANG_PKG_LDFLAGS="-X main.version=${PV}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/go-yaml/yaml:f7716cb -> gopkg.in/yaml.v2"
	"github.com/Masterminds/semver:513f3dc" # v1.0.1
	"github.com/Masterminds/vcs:9c0db65" # v1.4.0
	"github.com/codegangsta/cli:5db7419"
)

inherit golang-single

DESCRIPTION="Glide is a vendor Package Management for Golang"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_test() {
	if has sandbox $FEATURES && has usersandbox $FEATURES; then
		eerror "Tests require 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
