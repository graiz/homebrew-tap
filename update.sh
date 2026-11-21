#!/bin/sh
# Point the formula at a release of kb: ./update.sh 0.2.0
#
# Puts the version, and each archive's checksum from that release's .sha256
# files, in Formula/kittybrowser.rb. Commit and push the result.
set -eu

version="${1:?usage: ./update.sh VERSION (such as 0.2.0)}"
version="${version#v}"
formula="Formula/kittybrowser.rb"
base="https://github.com/graiz/kittybrowser/releases/download/v$version"

sed -i.bak "s/^  version \".*\"/  version \"$version\"/" "$formula"
for target in aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu; do
  sum="$(curl -fsSL "$base/kb-$target.tar.gz.sha256" | cut -d ' ' -f 1)" ||
    { echo "update.sh: no checksum for $target in v$version; has the release finished building?" >&2; exit 1; }
  # The sha256 line follows the url line that names this target.
  sed -i.bak "/kb-$target.tar.gz\"/{n;s/sha256 \".*\"/sha256 \"$sum\"/;}" "$formula"
done
rm -f "$formula.bak"
echo "update.sh: $formula now installs kb $version"
