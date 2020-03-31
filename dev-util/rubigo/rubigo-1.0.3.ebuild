# Copyright 1999-2020 Go Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
aho-corasick-0.6.3
ansi_term-0.9.0
atty-0.2.3
bitflags-0.7.0
bitflags-0.9.1
cc-1.0.3
cfg-if-0.1.2
clap-2.27.1
cmake-0.1.26
curl-0.4.8
curl-sys-0.3.15
fuchsia-zircon-0.2.1
fuchsia-zircon-sys-0.2.0
futures-0.1.17
futures-cpupool-0.1.7
git2-0.6.8
idna-0.1.4
json-0.11.10
kernel32-sys-0.2.2
lazy_static-0.2.9
libc-0.2.33
libgit2-sys-0.6.16
libssh2-sys-0.2.6
libz-sys-1.0.18
matches-0.1.6
memchr-1.0.2
num_cpus-1.7.0
openssl-probe-0.1.1
openssl-sys-0.9.20
percent-encoding-1.0.0
pkg-config-0.3.9
rand-0.3.17
redox_syscall-0.1.31
redox_termios-0.1.1
regex-0.2.2
regex-syntax-0.4.1
semver-0.9.0
semver-parser-0.7.0
socket2-0.2.4
strsim-0.6.0
tempdir-0.3.5
termion-1.5.1
textwrap-0.9.0
thread_local-0.3.4
threadpool-1.7.1
time-0.1.38
unicode-bidi-0.3.4
unicode-normalization-0.1.5
unicode-width-0.1.4
unreachable-1.0.0
url-1.6.0
utf8-ranges-1.0.0
vcpkg-0.2.2
vec_map-0.8.0
void-1.0.2
winapi-0.2.8
winapi-build-0.1.1
ws2_32-sys-0.2.1
"

inherit cargo

DESCRIPTION="Golang dependency tool and package manager"
HOMEPAGE="https://github.com/yaa110/rubigo"
SRC_URI="https://github.com/yaa110/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
$(cargo_crate_uris ${CRATES})"

RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	cargo_src_install
	dodoc *.md
}
