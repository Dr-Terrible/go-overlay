# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/noraesae"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN//-cat}"

# Declare dependencies
GOLANG_PKG_DEPENDENCIES=(
	"github.com/gorilla/websocket:a3ec486e6a"
	"github.com/russross/blackfriday:8cec3a854e"
	"github.com/skratchdot/open-golang:c8748311a7"
	"github.com/shurcooL/sanitized_anchor_name:11a20b799b"
	"github.com/codegangsta/cli:142e6cd241"

	# unit testing
	"github.com/onsi/ginkgo:462326b162"
	"github.com/onsi/gomega:d6c945f9fd"
)

inherit golang-single

DESCRIPTION="A Markdown previewer written in GoLang"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86 arm"
