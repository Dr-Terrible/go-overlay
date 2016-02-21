# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/jgautheron"
GOLANG_PKG_VERSION="a5c712731047884705541fa727fa1682b4cf1f1c"
#GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1
#GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="Find repeated strings that could be replaced by a constant."
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

#src_test() {
#	if has sandbox $FEATURES && has network-sandox $FEATURES; then
#		eerror "Some tests require 'sandbox', and 'network-sandox' to be disabled in FEATURES."
#	fi
#
#	golang-single_src_test
#}
