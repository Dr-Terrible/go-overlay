# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/${PN}-cd"
GOLANG_PKG_IMPORTPATH_ALIAS="github.com/recruit-tech"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_LDFLAGS="-X ${GOLANG_PKG_IMPORTPATH_ALIAS}/${PN}/version.Version=v${PV}"
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/ainoya/glog:20260dc"
	"github.com/andybons/hipchat:08bf65e"
	"github.com/go-yaml/yaml:1b97919"
	"github.com/google/go-github:1e55bf6"
	"github.com/google/go-querystring:2a60fc2"
	"github.com/stretchr/objx:1a9d0bb"
	"github.com/stretchr/testify:de7fcff"
	"github.com/tbruyelle/hipchat-go:7fdd5b2"
	"github.com/go-check/check:11d3bc7 -> gopkg.in/check.v1"
	"github.com/go-yaml/yaml:9f9df34 -> gopkg.in/yaml.v1"
	"github.com/golang/oauth2:3c3a985 -> golang.org/x"
	"github.com/golang/net:749a502 -> golang.org/x"
)

inherit golang-single

DESCRIPTION="Walter is a tiny deployment pipeline"
HOMEPAGE="http://ainoya.io/walter"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86 arm"
