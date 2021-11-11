# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	ahash-0.6.3
	aho-corasick-0.7.18
	ansi_term-0.11.0
	anyhow-1.0.42
	array-macro-1.0.5
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.3.2
	bytes-1.1.0
	cargo-platform-0.1.1
	cargo_metadata-0.12.3
	cc-1.0.69
	cfg-if-1.0.0
	chrono-0.4.19
	clap-2.33.3
	crossbeam-channel-0.5.1
	crossbeam-utils-0.8.5
	crossterm-0.19.0
	crossterm-0.20.0
	crossterm_winapi-0.7.0
	crossterm_winapi-0.8.0
	cursive-0.16.3
	cursive_buffered_backend-0.5.0
	cursive_core-0.2.2
	darling-0.10.2
	darling_core-0.10.2
	darling_macro-0.10.2
	derivative-2.2.0
	dirs-next-2.0.0
	dirs-sys-next-0.1.2
	either-1.6.1
	enum-map-0.6.4
	enum-map-derive-0.4.6
	erased-serde-0.3.16
	fnv-1.0.7
	fuchsia-cprng-0.1.1
	futures-core-0.3.16
	getrandom-0.2.3
	half-1.7.1
	heck-0.3.3
	hermit-abi-0.1.19
	hostname-0.3.1
	humantime-2.1.0
	ident_case-1.0.1
	instant-0.1.10
	itertools-0.10.1
	itoa-0.4.7
	jobserver-0.1.22
	lazy_static-1.4.0
	libbpf-cargo-0.9.3
	libbpf-rs-0.13.0
	libbpf-sys-0.5.0-2
	libc-0.2.98
	lock_api-0.4.4
	log-0.4.14
	maplit-1.0.2
	match_cfg-0.1.0
	memchr-2.4.0
	memmap-0.7.0
	memmap2-0.3.0
	memoffset-0.6.4
	mio-0.7.13
	miow-0.3.7
	nix-0.22.0
	ntapi-0.3.6
	num-0.3.1
	num-complex-0.3.1
	num-integer-0.1.44
	num-iter-0.1.42
	num-rational-0.3.2
	num-traits-0.2.14
	num_cpus-1.13.0
	num_enum-0.5.2
	num_enum_derive-0.5.2
	numtoa-0.1.0
	once_cell-1.8.0
	openat-0.1.21
	os_info-3.0.7
	owning_ref-0.4.1
	parking_lot-0.11.1
	parking_lot_core-0.8.3
	paste-1.0.5
	pest-2.1.3
	pkg-config-0.3.19
	plain-0.2.3
	ppv-lite86-0.2.10
	proc-macro-crate-1.0.0
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.28
	quote-1.0.9
	rand-0.4.6
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.3.1
	rand_core-0.4.2
	rand_core-0.6.3
	rand_hc-0.3.1
	rdrand-0.4.0
	redox_syscall-0.2.9
	redox_termios-0.1.2
	redox_users-0.4.0
	regex-1.5.4
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	rustversion-1.0.5
	ryu-1.0.5
	same-file-1.0.6
	scopeguard-1.1.0
	scroll-0.10.2
	scroll_derive-0.10.5
	semver-0.11.0
	semver-1.0.4
	semver-parser-0.10.2
	serde-1.0.126
	serde_cbor-0.11.1
	serde_derive-1.0.126
	serde_json-1.0.66
	signal-hook-0.1.17
	signal-hook-0.3.9
	signal-hook-mio-0.2.1
	signal-hook-registry-1.4.0
	slog-2.7.0
	slog-async-2.7.0
	slog-term-2.8.0
	smallvec-1.6.1
	stable_deref_trait-1.2.0
	static_assertions-1.1.0
	strsim-0.8.0
	strsim-0.9.3
	structopt-0.3.25
	structopt-derive-0.4.18
	strum_macros-0.21.1
	syn-1.0.74
	take_mut-0.2.2
	tempdir-0.3.7
	tempfile-3.2.0
	term-0.7.0
	termion-1.5.6
	textwrap-0.11.0
	thiserror-1.0.30
	thiserror-impl-1.0.30
	thread_local-1.1.3
	threadpool-1.8.1
	time-0.1.43
	toml-0.5.8
	ucd-trie-0.1.3
	unicode-segmentation-1.8.0
	unicode-width-0.1.8
	unicode-xid-0.2.2
	users-0.11.0
	vec_map-0.8.2
	version_check-0.9.3
	vsprintf-2.0.0
	walkdir-2.3.2
	wasi-0.10.2+wasi-snapshot-preview1
	wasmer_enumset-1.0.1
	wasmer_enumset_derive-0.5.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	xi-unicode-0.3.0
	zstd-0.8.0+zstd.1.4.9
	zstd-safe-4.0.0+zstd.1.4.9
	zstd-sys-1.5.0+zstd.1.4.9
"

inherit cargo

DESCRIPTION="An interactive tool to view and record historical system data"
HOMEPAGE="https://github.com/facebookincubator/below"
SRC_URI="
	https://github.com/facebookincubator/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Boost-1.0 ISC LGPL-2.1 MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

BDEPEND="
	sys-devel/clang
	virtual/pkgconfig
	>=virtual/rust-1.56.0[rustfmt]
"
RDEPEND="
	virtual/libelf
	sys-libs/zlib
"
DEPEND="
	${RDEPEND}
	sys-libs/ncurses
"

QA_FLAGS_IGNORED="usr/bin/below"

src_install() {
	cargo_src_install --path below

	keepdir /var/log/below
}
