# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X main.version=${PV} -X main.commit=d9f13a3"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/pkg/errors:645ef00" #v0.8.0
	"github.com/apex/log:0296d6e" #v1.0.0
	"github.com/google/go-github:8c08f4f"
	"github.com/goreleaser/archive:caa5f3f" #v1.0.0
	"github.com/mattn/go-zglob:4b74c24"
	"github.com/urfave/cli:cfb3883"
	"github.com/golang/oauth2:9ff8ebc -> golang.org/x"
	"github.com/golang/sync:fd80eb9 -> golang.org/x"
	"github.com/go-yaml/yaml:eb3733d -> gopkg.in/yaml.v2"
	"github.com/google/go-querystring:53e6ce1"
	"github.com/golang/net:a337091 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Deliver Go binaries as fast and easily as possible"
HOMEPAGE="https://goreleaser.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
IUSE="doc"

src_install() {
	golang-single_src_install

	# TODO: use gihub.com/apex/static to generate the HTML docs
	use doc && dodoc -r docs/*
}
