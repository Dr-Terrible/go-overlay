# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/xlab"
GOLANG_PKG_VERSION="942e7819b45f80c8b659319dfe6171d5844e75b2"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/cznic/cc:4b6ffb9"
	"github.com/cznic/golex:4ab7c5e"
	"github.com/cznic/mathutil:7764e6a"
	"github.com/cznic/strutil:529a34b"
	"github.com/cznic/xc:056465b"
	"github.com/tj/go-spin:30574f5" #v1.1.0
	"github.com/xlab/pkgconfig:cea12a0"
	"github.com/golang/tools:c4b4e4b -> golang.org/x"
	"github.com/go-yaml/yaml:7f97868 -> gopkg.in/yaml.v2"  #v2.1.1
)

inherit golang-single

DESCRIPTION="Automatic C-Go Bindings Generator for Go Programming Language"
HOMEPAGE="https://sphere.software/c-for-go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_test() {
	GOLANG_PKG_IS_MULTIPLE=1
	golang-single_src_test
}
