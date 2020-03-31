# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/revel"
GOLANG_PKG_NAME="cmd"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/${PN//-cli}"
GOLANG_PKG_OUTPUT_NAME="${PN//-cli}"
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/agtorre/gocolorize:f42b554"
	"github.com/revel/revel:8d01a05"            #v0.13.1
	"github.com/revel/config:75f5ee6"           #v0.13.0
	"github.com/revel/modules:53ac311"          #v0.13.0
	"github.com/revel/revel.github.io:caf19c2 " #v0.13.1
	"github.com/robfig/pathtree:41257a1"
	"github.com/golang/net:4d38db7 -> golang.org/x"
	"github.com/golang/sys:a646d33 -> golang.org/x"
	"github.com/go-fsnotify/fsnotify:a8a77c9 -> gopkg.in/fsnotify.v1" #v1.3.1
	"github.com/klauspost/cpuid:09cded8"    #v1.0
	"github.com/klauspost/crc32:19b0b33"    #v1.0
	"github.com/klauspost/compress:006acde" #v1.0

	# Unit testing
	"github.com/revel/examples:12bbefe" #v0.13.0
)

inherit golang-single

DESCRIPTION="Command-line tool for Revel framework"
HOMEPAGE="http://revel.github.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="doc? ( www-apps/jekyll )"

src_prepare() {
	golang-single_src_prepare

	cp ../revel/skeleton/public/js/jquery-2.2.4.min.js \
		../revel.github.io/js/ || die

	local baseURL="/usr/share/doc/${PF}/html"
	sed -i \
		-e "s:href=\"\/:href=\"${baseURL}\/:" \
		-e "s:{{ page.root }}:${baseURL}:" \
		-e "s:\/\/ajax.googleapis.com\/ajax\/libs\/jquery\/2.1.3\/jquery.min.js:${baseURL}\/js\/jquery-2.2.4.min.js:" \
		-e "s:^\@import.*::" \
		-e "s:<script>.*::" \
		-e "s:.*include analytics.html.*::" \
		../revel.github.io/_includes/head.html \
		../revel.github.io/_includes/topnav.html \
		../revel.github.io/index.html \
		../revel.github.io/tutorial/index.md \
		../revel.github.io/css/revel.4.css \
		|| die
}

src_install() {
	golang-single_src_install

	# install doc
	if use doc; then
		jekyll build --source "${GOPATH}/src/github.com/revel/revel.github.io" --destination "${T}"/html || die
	    dodoc -r "${T}"/html
	fi
}
