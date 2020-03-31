# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/opencontainers"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

inherit golang-single

DESCRIPTION="A CLI tool for spawning and running containers according to the OCF specs"
HOMEPAGE="http://runc.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE+=" +seccomp apparmor selinux"

RESTRICT+=" test"

DEPEND="dev-go/go-md2man"
RDEPEND="apparmor? ( sys-libs/libapparmor )
	seccomp? ( sys-libs/libseccomp )
	selinux? ( sys-libs/libselinux )"

src_compile() {
	use seccomp && GOLANG_PKG_TAGS+=" seccomp"
	use apparmor && GOLANG_PKG_TAGS+=" apparmor"
	use selinux && GOLANG_PKG_TAGS+=" selinux"
	golang-single_src_compile
}

src_install() {
	golang-single_src_install

	# install man pages
	man/md2man-all.sh > /dev/null 2>&1 || die
	doman man/man[0-9]/*
}
