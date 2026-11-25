#!/usr/bin/env bash
set -eu
root=$(mktemp -d)
trap 'rm -rf "$root"' EXIT
cd "$(dirname "$0")/.."
make install PREFIX="$root/prefix"
export HOME="$root/home" XDG_CONFIG_HOME="$root/config" EDITOR=true
unset FSW_RULES
fsw="$root/prefix/bin/fsw"
"$fsw" edit
cmp share/fsw/rules.example.toml "$XDG_CONFIG_HOME/fsw/rules.toml"
export FSW_RULES="$root/custom/registry.toml"
"$fsw" edit
cmp share/fsw/rules.example.toml "$FSW_RULES"
printf 'watch = []\n' > "$FSW_RULES"
"$fsw" edit
grep -Fxq 'watch = []' "$FSW_RULES"
