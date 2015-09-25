# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GOLANG_PKG_IMPORTPATH="github.com/shurcooL"
GOLANG_PKG_VERSION="2e0d1eeea888947f677fc9092434b2bceea4b61d"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_USE_GENERATE=1
GOLANG_PKG_HAVE_TEST=1

# Declares dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/shurcooL/go:8087d7ae25"
	"github.com/shurcooL/gopherjslib:d8eec8734d"
	"github.com/shurcooL/httpfs:88fa6f82a8"
	"github.com/shurcooL/gostatus:133f6c678a"
	"github.com/shurcooL/vfsgen:9467ba831f"
	"github.com/gopherjs/gopherjs:52a9b31eab"
	"github.com/golang/net:669b27b881 -> golang.org/x"
	"github.com/golang/tools:4f50f44d7a -> golang.org/x"
	"github.com/kardianos/osext:6e7f843663"
	"github.com/neelance/sourcemap:8994456d80"
	"github.com/go-fsnotify/fsnotify:96c060f6a6 -> gopkg.in/fsnotify.v1"
	"github.com/dominikh/go-js-dom:5f25eefafd"
	"github.com/dominikh/go-js-xhr:00e3346113"
	"github.com/dominikh/go-js-util:96b8dd9d16"
	"github.com/google/go-github:0d67682ce8"
	"github.com/google/go-querystring:547ef5ac97"
)

inherit golang-single

DESCRIPTION="An app that displays updates for the Go packages in your GOPATH"
HOMEPAGE="https://${GOLANG_PKG_IMPORTPATH}/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

src_prepare() {
	golang-single_src_prepare

	golang_fix_importpath_alias \
		"github.com/dominikh/go-js-dom" \
		"honnef.co/go/js/dom"

	golang_fix_importpath_alias \
		"github.com/dominikh/go-js-xhr" \
		"honnef.co/go/js/xhr"

	golang_fix_importpath_alias \
		"github.com/dominikh/go-js-util" \
		"honnef.co/go/js/util"
}