# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/${PN}io"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/BurntSushi/toml:056c9bc7be"
	"github.com/bitly/go-hostpool:58b95b10d6"
	"github.com/nsqio/go-nsq:0f97a46d80"
	"github.com/bitly/go-simplejson:18db6e68d8"
	"github.com/bmizerany/perks:6cb9d9d729"
	"github.com/mreiferson/go-options:2cf7eb1fdd"
	"github.com/mreiferson/go-snappystream:028eae7ab5"
	"github.com/bitly/timer_metrics:afad1794bb"
	"github.com/blang/semver:9bf7bff48b"
	"github.com/julienschmidt/httprouter:6aacfd5ab5"
)

inherit golang-single

DESCRIPTION="A real-time distributed messaging platform, written in GoLang"
HOMEPAGE="http://nsq.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="dev-libs/protobuf:0/9"

src_test() {
	if has sandbox $FEATURES && has usersandbox $FEATURES; then
		eerror "Tests require sandbox, and usersandbox to be disabled in FEATURES."
	fi

	golang-single_src_test
}
