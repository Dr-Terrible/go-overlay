# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/${PN}"
GOLANG_PKG_BUILDPATH="/cmd/${PN//go-/}"
#GOLANG_PKG_HAVE_TEST=1

#GOLANG_PKG_DEPENDENCIES=(
#	# Unit Testing
#	"github.com/naoina/denco:9af2ba0"
#	"github.com/go-swagger/scan-repo-boundary:196ec52"
#	"github.com/golang/net:2cba614 -> golang.org/x"
#	"github.com/asaskevich/govalidator:5fe52de" #v2
#	"github.com/onsi/ginkgo:462326b" #v1.2.0
#	"github.com/onsi/gomega:0fe2044"
#)

inherit golang-single

DESCRIPTION="Swagger 2.0 implementation for GoLang"
HOMEPAGE="https://goswagger.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT+=" test"

DEPEND=">=dev-lang/go-1.5.1"
