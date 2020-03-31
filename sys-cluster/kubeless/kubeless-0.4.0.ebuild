# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/kubeless"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/..."
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_LDFLAGS="-X github.com/kubeless/kubeless/cmd/kubeless/version.VERSION=${PV} -X github.com/kubeless/kubeless/cmd/kubeless/version.GITCOMMIT=4f4f531"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

inherit golang-single

DESCRIPTION="Kubernetes Native Serverless Framework"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_test() {
	GOLANG_PKG_BUILDPATH="..."
	golang-single_src_test
}
