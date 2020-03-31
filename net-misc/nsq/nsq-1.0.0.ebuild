# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/${PN}io"
GOLANG_PKG_VERSION="${PV}-compat"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/BurntSushi/toml:2dff111"
	"github.com/bitly/go-hostpool:58b95b1"
	"github.com/nsqio/go-nsq:a53d495"
	"github.com/bitly/go-simplejson:18db6e6"
	"github.com/bmizerany/perks:6cb9d9d"
	"github.com/mreiferson/go-options:77551d2"
	"github.com/golang/snappy:d9eb7a3"
	"github.com/bitly/timer_metrics:afad179"
	"github.com/blang/semver:9bf7bff"
	"github.com/julienschmidt/httprouter:6aacfd5"
	"github.com/judwhite/go-svc:63c1240"
	"github.com/nsqio/go-diskqueue:d7805f8"

	# Doc
	"github.com/nsqio/nsqio.github.io:c5071ac"
)

inherit golang-single

DESCRIPTION="A real-time distributed messaging platform, written in GoLang"
HOMEPAGE="http://nsq.io"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86 arm"

DEPEND=">=dev-libs/protobuf-3.0.3:0"

src_install() {
	golang-single_src_install

	# install conf files
	dodoc -r contrib/*
}

src_test() {
	if has sandbox $FEATURES && has usersandbox $FEATURES; then
		eerror "Tests require sandbox, and usersandbox to be disabled in FEATURES."
	fi
	golang-single_src_test
}
