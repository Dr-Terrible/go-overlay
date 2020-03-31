# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/gobuffalo"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_IS_MULTIPLE=1
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/mitchellh/go-homedir:b8bc1bf"
	"github.com/gobuffalo/envy:e613c80"    #v1.3.0
	"github.com/pkg/errors:645ef00"        #v0.8.0
	"github.com/joho/godotenv:a79fa1e"     #v1.2.0
	"github.com/spf13/cobra:7b2c5ac"       #v0.0.1
	"github.com/spf13/pflag:e57e3ee"       #v1.0.0
	"github.com/golang/sync:fd80eb9 -> golang.org/x"
	"github.com/golang/net:c708664 -> golang.org/x"

	# Unit Testing
	"github.com/stretchr/testify:69483b4"
)

inherit golang-single

DESCRIPTION="The simple and easy way to embed static files into Go binaries"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"

src_prepare() {
	golang-single_src_prepare

	# disable examples compilation
	mv example _example || die
}
