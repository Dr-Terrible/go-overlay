# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/elves"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X github.com/elves/elvish/buildinfo.Version=${PV}"
#GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="A novel Unix shell"
HOMEPAGE="https://elvish.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

RESTRICT+=" test"

#src_test() {
#	GOLANG_PKG_IS_MULTIPLE=1
#	golang-single_src_test
#}

pkg_postinst() {
	if ! grep -q '^/usr/bin/elvish$' "${EROOT}"/etc/shells ; then
		ebegin "Updating /etc/shells"
		echo "/usr/bin/elvish" >> "${EROOT}"/etc/shells
		eend $?
	fi
}
