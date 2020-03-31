# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/pingcap"
GOLANG_PKG_ARCHIVEPREFIX="v"

inherit user systemd golang-single

DESCRIPTION="TiDB is a distributed SQL database compatible with MySQL protocol"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RESTRICT+=" test"

DEPEND="sys-apps/coreutils"

GOLANG_PKG_VENDOR=(
	"${S}/_vendor"
)

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 "/var/lib/${PN}" ${PN}
}

src_prepare() {
	sed -i \
		-e "s:/tmp/tidb:/var/lib/tidb:" \
		tidb-server/main.go config/config.go || die

	sed -i \
		-e "s:^LDFLAGS +=.*::" \
		Makefile || die
	golang-single_src_prepare
}

src_compile() {
	local ldflags=""
	ldflags+=" -X github.com/pingcap/tidb/mysql.TiDBReleaseVersion=${PV}"
	ldflags+=" -X github.com/pingcap/tidb/util/printer.TiDBGitHash=efb13f1"
	ldflags+=" -X github.com/pingcap/tidb/util/printer.TiDBGitBranch=release-1.0"
	ldflags+=" -X \"github.com/pingcap/tidb/util/printer.TiDBBuildTS=$(date -u '+%Y-%m-%d %I:%M:%S')\""
	LDFLAGS="${ldflags}" emake || die

	mv bin/${PN}-server "${GOBIN}"/ || die
}

src_install() {
	golang-single_src_install

	# install config files
	insinto /etc/${PN}
	newins config/config.toml.example config.toml

	# install init files
	systemd_dounit "${FILESDIR}"/systemd/${PN}.service
	systemd_newuserunit "${FILESDIR}"/systemd/${PN}.user.service ${PN}.service
	systemd_dotmpfilesd "${FILESDIR}"/systemd/${PN}.conf

	# install docs
	dodoc -r docs/*.md
}
