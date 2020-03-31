# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/hellofresh"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/ant0ine/go-json-rest:ce4b71c"
	"github.com/asaskevich/govalidator:7b3beb6"
	"github.com/bshuster-repo/logrus-logstash-hook:f93ff95"
	"github.com/dgrijalva/jwt-go:d2709f9"
	"github.com/dimfeld/httptreemux:a12c89c"
	"github.com/garyburd/redigo:8873b2f"
	"github.com/justinas/alice:052b8b6"
	"github.com/kelseyhightower/envconfig:f611eb3"
	"github.com/NYTimes/gziphandler:6710af5"
	"github.com/patrickmn/go-cache:1881a9b"
	"github.com/rs/cors:a62a804"
	"github.com/rs/xhandler:d9d9599"
	"github.com/Sirupsen/logrus:d264929"
	"github.com/ulule/limiter:c242da0"
	"github.com/golang/net:f315505 -> golang.org/x"
	"github.com/golang/sys:a408501 -> golang.org/x"
	"github.com/alexcesaro/statsd:7fea3f0 -> gopkg.in/alexcesaro/statsd.v2"
	"github.com/go-mgo/mgo:3f83fa5 -> gopkg.in/mgo.v2"

	# Unit testing
	"github.com/davecgh/go-spew:2df1748"
	"github.com/pmezard/go-difflib:d8ed262"
	"github.com/stretchr/testify:69483b4"
)

inherit golang-single

DESCRIPTION="An Api Gateway written in Go"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="examples"

src_install() {
	golang-single_src_install

	use examples && dodoc -r examples/*
}
