# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/dvyukov"
GOLANG_PKG_VERSION="241d86511f9b4bf8f01815b07d2f969ec52619b2"
GOLANG_PKG_BUILDPATH="/${PN} /${PN}-build"

GOLANG_PKG_DEPENDENCIES=(
	"github.com/elazarl/go-bindata-assetfs:57eb5e1"
	"github.com/golang/tools:4ad5335 -> golang.org/x"

	# Unit Testing
#	"github.com/golang/image:7c49269 -> golang.org/x"
#	"github.com/go-mgo/mgo:f402e3a -> gopkg.in/mgo.v2"
#	"github.com/google/flatbuffers:40b0351"
)

inherit golang-single

DESCRIPTION="Go-fuzz is a coverage-guided fuzzing solution for testing of Go packages"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"

DEPEND=">=dev-lang/go-1.5.1"
