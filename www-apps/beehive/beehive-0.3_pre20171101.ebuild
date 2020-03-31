# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/muesli"
GOLANG_PKG_VERSION="a43ef9547d05ddf74a8e0a2dfe8e758baa762934"
GOLANG_PKG_LDFLAGS="-X main.Version=0.2.99 -X main.CommitSHA=a43ef95"
GOLANG_PKG_TAGS="embed"
GOLANG_PKG_USE_CGO=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/muesli/beehive-vendor:890fc17"
	"github.com/muesli/beehive-admin-dist:648f36d"

	"github.com/PuerkitoBio/goquery:e1271ee"          #v1.1.0
	"github.com/briandowns/openweathermap:64ca52e"    #v0.9
	"github.com/golang/net:a337091 -> golang.org/x"
)

inherit user systemd golang-single

DESCRIPTION="An event and agent system which allows you to perform automated tasks"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="dev-go/go-bindata"

USER_NAME="${PN}"
USER_DIR="/var/lib/${USER_NAME}"

pkg_setup() {
	enewgroup ${USER_NAME}
	enewuser ${USER_NAME} -1 /bin/bash "${USER_DIR}" ${USER_NAME}
}

src_prepare() {
	golang-single_src_prepare

	# Copy vendored libs
	local beehivedir="${GOPATH}/src/github.com/muesli/${PN}"
	rmdir "${beehivedir}"/vendor || die
	mv "${beehivedir}"-vendor \
		"${beehivedir}"/vendor || die

	# Copy admin UI
	rmdir "${beehivedir}"/config || die
	mv "${beehivedir}"-admin-dist \
		"${beehivedir}"/config || die

	mv "${GOPATH}"/src/github.com/PuerkitoBio \
		"${beehivedir}"/vendor/github.com/ || die
}

src_compile() {
	# Build assets
	ebegin "Bulding assets"
		go-bindata \
			--tags embed \
			--pkg api \
			-o api/bindata.go \
			--ignore \\.git \
			assets/... config/... || die
	eend

	golang-single_src_compile
}

src_install() {
	golang-single_src_install

	# Install init scripts
	systemd_dounit "${FILESDIR}/${PN}.service"

	# Fix permissions of config files
	keepdir /etc/${PN}
	fperms 770 /etc/${PN}
	fowners -R ${USER_NAME}:${USER_NAME} /etc/${PN}
}
