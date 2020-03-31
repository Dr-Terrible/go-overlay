# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/glycerine"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_OUTPUT_NAME="zygo"
GOLANG_PKG_BUILDPATH="/cmd/${GOLANG_PKG_OUTPUT_NAME}"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/glycerine/blake2b:3c8c640"
	"github.com/glycerine/goconvey:b782d35"
	"github.com/glycerine/liner:72909af"
	"github.com/glycerine/tmframe:fa6afee"
	"github.com/shurcooL/go-goon:a0792a0"
	"github.com/tinylib/msgp:362bfb3"
	"github.com/ugorji/go:d23841a"
	"github.com/glycerine/zebrapack:58fd070" #v3.4.0
	"github.com/jtolds/gls:8ddce2a"          #v4.2.0
	"github.com/nats-io/go-nats:61923ed"     #v1.2.2
	"github.com/nats-io/nuid:289cccf"        #v1.0.0
	"github.com/philhofer/fwd:98c11a7"
	"github.com/shurcooL/go:75f299d"
)

inherit golang-single

DESCRIPTION="A 100% Golang, easy-to-use Lisp"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/nats-io/go-nats" \
		"github.com/nats-io/nats"
}
