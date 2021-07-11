# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/flant/werf/cmd/werf"
GOLANG_PKG_VERSION="ae8a0a217ef520a9909bef290a8d2f929cb8bc1d"

inherit golang-single

DESCRIPTION="Werf (previously known as Dapp)is made to implement and support Continuous Integration and Continuous Delivery (CI/CD)"
homepage="https://werf.io"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64 ~riscv64"

RESTRICT+=" test"

#RDEPEND="|| (app-emulation/docker app-admin/helm app-emulation/docker-composesys-cluster/kubectl)"  
