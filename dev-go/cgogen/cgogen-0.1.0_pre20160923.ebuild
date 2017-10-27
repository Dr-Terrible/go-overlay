# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

GOLANG_PKG_IMPORTPATH="github.com/xlab"
GOLANG_PKG_VERSION="8637cfa7e0bc1fa5ee85c6bce482a354c7bdcd3e"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	#"github.com/pkg/errors:01fa410" #v0.7.0
	"github.com/cznic/cc:24f4bbb"
	"github.com/cznic/golex:da5a715"
	"github.com/cznic/mathutil:78ad7f2"
	"github.com/cznic/strutil:1eb03e3"
	"github.com/cznic/xc:5fc7735"
	"github.com/tj/go-spin:8667629"
	"github.com/xlab/pkgconfig:8e3bb34"
	"github.com/go-yaml/yaml:31c2992 -> gopkg.in/yaml.v2"
	"github.com/golang/tools:3f4088e -> golang.org/x"

	# Unit Testing
	"github.com/stretchr/testify:f390dcf" #v1.1.3
)

inherit golang-single

DESCRIPTION="Automatic CGo Bindings Generator for Golang"
HOMEPAGE="https://cgogen.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
