# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/goadesign"
GOLANG_PKG_VERSION="de9986a748f957c94c26af68218fb1f4a4c3b0b8"
GOLANG_PKG_BUILDPATH="/${PN}gen"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/julienschmidt/httprouter:8c199fb"
	"github.com/manveru/faker:46ac366"
	"github.com/zach-klippenstein/goregen:a55a25e"
	"github.com/alecthomas/kingpin:8852570 -> gopkg.in/alecthomas/kingpin.v2" #v2.1.18
	"github.com/alecthomas/template:14fd436"
	"github.com/alecthomas/units:2efee85"
	"github.com/spf13/cobra:65a708c"
	"github.com/spf13/pflag:7f60f83"
	"github.com/golang/tools:a17fa84  -> golang.org/x"

	# unit testing
	"github.com/inconshreveable/log15:b105bd3 -> gopkg.in/inconshreveable/log15.v2" #v2.11
	"github.com/tylerb/graceful:48afeb2 -> gopkg.in/tylerb/graceful.v1" #v1.2.3
	"bitbucket.org/pkg/inflect:8961c3750a47"
	"github.com/mattn/go-colorable:3dac7b4"
	"github.com/golang/net:4a71d18255 -> golang.org/x"
	"github.com/onsi/ginkgo:462326b" #v1.2.0
	"github.com/onsi/gomega:0fe2044"
	"github.com/go-swagger/go-swagger:a10c3e8" #v0.3.0
	"github.com/PuerkitoBio/purell:d69616f"
	"github.com/opennota/urlesc:5fa9ff0"
	"github.com/go-yaml/yaml:f7716cb -> gopkg.in/yaml.v2"
)

inherit golang-single

DESCRIPTION="Goa is a framework for building RESTful microservices in Go"
HOMEPAGE="http://goa.design"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RDEPEND="dev-go/go-tools"

src_test() {
	if has network-sandbox $FEATURES; then
		eerror "Some tests require 'network-sandbox' to be disabled in FEATURES."
	fi

	golang-single_src_test
}
