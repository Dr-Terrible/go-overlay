# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/securego"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_LDFLAGS="-X main.Version=${PV} -X main.GitTag=${PV}"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/nbutton23/zxcvbn-go:ae427f1"
	"github.com/golang/tools:23e62d3 -> golang.org/x"  #v0.3.3
	"github.com/go-yaml/yaml:53403b5 -> gopkg.in/yaml.v2"  #v2.2.8
)

inherit golang-single

DESCRIPTION="Inspects golang source code for security problems"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm x86"

pkg_setup() {
	GOLANG_PKG_LDFLAGS+=" -X main.BuildDate=$( date +%F )"
}
