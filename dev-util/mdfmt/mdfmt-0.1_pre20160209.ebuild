# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/moorereason"
GOLANG_PKG_VERSION="7d7dd58e8df422b308264756583e7ddefc52aea3"
GOLANG_PKG_HAVE_TEST=1

GOLANG_PKG_DEPENDENCIES=(
	"github.com/shurcooL/markdownfmt:b38f26a"
	"github.com/spf13/hugo:3c100cc"
	"github.com/BurntSushi/toml:056c9bc7be"
	"github.com/russross/blackfriday:006144a"
	"github.com/mattn/go-runewidth:d037b52"
	"github.com/shurcooL/go:63a73a4"
	"github.com/shurcooL/sanitized_anchor_name:10ef21a"
	"github.com/go-yaml/yaml:f7716cb -> gopkg.in/yaml.v2"
)

inherit golang-single

DESCRIPTION="Like gofmt, but for Markdown with front matter."

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
