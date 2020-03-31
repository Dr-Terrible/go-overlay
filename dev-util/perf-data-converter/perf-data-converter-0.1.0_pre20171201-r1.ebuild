# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN//-/_}"
ECOMMIT="b86dd5276ecdba751d56be4f1bafca7065b78ea4"

DESCRIPTION="Convert Linux perf files to the profile.proto format used by pprof"
HOMEPAGE="https://github.com/google/${MY_PN}"
SRC_URI="https://github.com/google/${MY_PN}/archive/${ECOMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug test libressl elibc_uclibc"

RESTRICT+=" mirror"

S="${WORKDIR}/${MY_PN}-${ECOMMIT}"

RDEPEND="dev-libs/protobuf:0=
	!elibc_uclibc? ( dev-libs/elfutils )
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )"
DEPEND="dev-cpp/gtest"

src_prepare() {
	default

	# remove bundled libs
	rm -r third_party || die
}

src_compile() {
	emake perf_to_profile || die
}

src_install() {
	dobin perf_to_profile
}
