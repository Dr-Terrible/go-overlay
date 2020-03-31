# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="${PV/_/-}"
CODENAME="maroilles"
EGO_PN="github.com/containous/${PN}"
EGO_VENDOR=( "github.com/containous/go-bindata e237f24c9fab" )

inherit golang-vcs-snapshot systemd user

DESCRIPTION="A modern HTTP reverse proxy and load balancer made to deploy microservices"
HOMEPAGE="https://traefik.io"
ARCHIVE_URI="https://${EGO_PN}/releases/download/v${MY_PV}/${PN}-v${MY_PV}.src.tar.gz -> ${P}.tar.gz"
SRC_URI="${ARCHIVE_URI} ${EGO_VENDOR_URI}"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug examples pie"

DOCS=( {CHANGELOG,CONTRIBUTING,README}.md )
QA_PRESTRIPPED="usr/bin/.*"

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

pkg_pretend() {
	if [[ "${MERGE_TYPE}" != binary ]]; then
		# shellcheck disable=SC2086
		(has test ${FEATURES} && has network-sandbox ${FEATURES}) && \
			die "The test phase requires 'network-sandbox' to be disabled in FEATURES"
	fi
}

pkg_setup() {
	enewgroup traefik
	enewuser traefik -1 -1 -1 traefik
}

src_compile() {
	export GOPATH="${G}"
	local PATH="${G}/bin:$PATH"
	local myldflags=(
		"$(usex !debug '-s -w' '')"
		-X "${EGO_PN}/version.Version=${MY_PV}"
		-X "${EGO_PN}/version.Codename=${CODENAME}"
		-X "'${EGO_PN}/version.BuildDate=$(date -u '+%Y-%m-%d_%I:%M:%S%p')'"
	)
	local mygoargs=(
		-v -work -x
		-buildmode "$(usex pie pie exe)"
		-asmflags "all=-trimpath=${S}"
		-gcflags "all=-trimpath=${S}"
		-ldflags "${myldflags[*]}"
	)

	# Build go-bindata locally
	go install ./vendor/github.com/containous/go-bindata/go-bindata || die

	go generate || die
	go build "${mygoargs[@]}" ./cmd/traefik || die
}

src_test() {
	./script/make.sh test-unit || die
}

src_install() {
	dobin traefik
	use debug && dostrip -x /usr/bin/traefik
	einstalldocs

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	systemd_dounit "${FILESDIR}/${PN}.service"

	insinto /etc/traefik
	newins traefik.sample.toml traefik.toml.example

	if use examples; then
		docinto examples
		dodoc -r examples/*
		docompress -x "/usr/share/doc/${PF}/examples"
	fi

	diropts -o traefik -g traefik -m 0750
	keepdir /var/log/traefik
}

pkg_postinst() {
	if [[ ! -e "${EROOT}/etc/traefik/traefik.toml" ]]; then
		elog "No traefik.toml found, copying the example over"
		cp "${EROOT}"/etc/traefik/traefik.toml{.example,} || die
	else
		elog "traefik.toml found, please check example file for possible changes"
	fi
}
