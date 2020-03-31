# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/motemen"
GOLANG_PKG_VERSION="f04e005b13815c4455474c5550f069f6776eff5e"
GOLANG_PKG_BUILDPATH="/cmd/gompat"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/daviddengcn/go-colortext:511bcaf"
	"github.com/motemen/go-vcs-gitcmd-fastopen:5c039f1"
	"github.com/golang/tools:6361b57 -> golang.org/x"  # do not upgrade!
	"github.com/sourcegraph/go-vcs:0167c4b -> sourcegraph.com/sourcegraph"
	"github.com/sourcegraph/go-diff:2083912 -> sourcegraph.com/sourcegraph"
	"github.com/sqs/pbtypes:4d1b9dc -> sourcegraph.com/sqs"
	"github.com/gogo/protobuf:909568b" #v0.3

	# Unit Testing
	"github.com/stretchr/testify:f390dcf" #1.1.3
)

inherit golang-single

DESCRIPTION="A tool to show Go package's API changes between two (git) revisions"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
