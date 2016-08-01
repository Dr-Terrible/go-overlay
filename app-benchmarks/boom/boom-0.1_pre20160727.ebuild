# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/rakyll"
GOLANG_PKG_VERSION="e721321a71a42df095d43519103a25c2ea802240"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/rakyll/pb:8d46b8b"
)

inherit golang-single

DESCRIPTION="HTTP(S) load generator, ApacheBench (ab) replacement, written in GoLang"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
