# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/muesli"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_HAVE_TEST=1
GOLANG_PKG_USE_CGO=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/muesli/beehive-admin-dist:1af78df"
	"github.com/muesli/go.hue:8aefcc6"
	"github.com/muesli/goefa:26c9a51"
	"github.com/muesli/smolder:0a5c3dd"
	"github.com/nlopes/slack:6519657"
	"github.com/ChimeraCoder/anaconda:00ecb7b"
	"github.com/ChimeraCoder/tokenbucket:c5a9275"
	"github.com/MariaTerzieva/gotumblr:4dbe615"
	"github.com/Sirupsen/logrus:c078b1e" # v0.11.2
	"github.com/advancedlogic/GoOse:cd96655"
	"github.com/advancedlogic/goquery:aeb03ad"
	"github.com/azr/backoff:53511d3"
	"github.com/bjarneh/latinx:4dfe9ba"
	"github.com/dustin/go-jsonpointer:ba0abea"
	"github.com/emicklei/go-restful:371e2e9" #v2.1.0
	"github.com/andybalholm/cascadia:349dd02"
	"github.com/dustin/gojson:2e71ec9"
	"github.com/fluffle/goirc:329a62d"
	"github.com/golang/mock:bd3c8e8"
	"github.com/guelfey/go.dbus:f6a3a23"
	"github.com/hoisie/web:a498c02"
	"github.com/huin/goserial:7b90efd"
	"github.com/jteeuwen/go-pkg-rss:72391e6"
	"github.com/jteeuwen/go-pkg-xmlx:76f54ee"
	"github.com/kurrik/oauth1a:cb1b80e"
	"github.com/mattn/go-xmpp:325c112"
	"github.com/kr/pretty:cfb55aa"
	"github.com/kr/text:7cafcd8"
	"github.com/nu7hatch/gouuid:179d4d0"
	"github.com/odwrtw/transmission:b77bd09"
	"github.com/rogpeppe/go-charset:e9ff06f"
	"github.com/garyburd/go-oauth:18d3217"
	"github.com/technoweenie/multipartstreamer:a90a01d" #v1.0.1
	"github.com/golang/crypto:453249f -> golang.org/x"
	"github.com/golang/net:b4690f4 -> golang.org/x"
	"github.com/fatih/set:27c4092 -> gopkg.in/fatih/set.v0" #v0.1.1
	"github.com/go-telegram-bot-api/telegram-bot-api:0a57807 -> gopkg.in/telegram-bot-api.v4" #v.4.6
)

inherit golang-single

DESCRIPTION="An event and agent system which allows you to perform automated tasks"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"

src_prepare() {
	golang-single_src_prepare

	rmdir config || die
	ln -s "${GOPATH}"/src/github.com/muesli/${PN}-admin-dist config
}
