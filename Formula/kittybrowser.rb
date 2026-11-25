# Installs the prebuilt kb from a GitHub release of graiz/kittybrowser.
# update.sh fills in the version and checksums for each release.
class Kittybrowser < Formula
  desc "Fast web browser that runs in a terminal pane, drawn with kitty graphics"
  homepage "https://github.com/graiz/kittybrowser"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/graiz/kittybrowser/releases/download/v0.3.0/kb-aarch64-apple-darwin.tar.gz"
      sha256 "ae40f60545a9713b7398a809d9a12cc3bc280e80771c2485370640c8e3085ecb"
    end
    on_intel do
      url "https://github.com/graiz/kittybrowser/releases/download/v0.3.0/kb-x86_64-apple-darwin.tar.gz"
      sha256 "95116e012df878af4f1082e77aed973886abe23ae32b5e779020b1c8d00c6262"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graiz/kittybrowser/releases/download/v0.3.0/kb-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14149eec61db9f06dc790099fb7f1e548c76ce32795262b83e76b35139fee904"
    end
    on_intel do
      url "https://github.com/graiz/kittybrowser/releases/download/v0.3.0/kb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a56e23266e3bdc54e50cc0fc64cc9136204e4daf44ab98af3cec278af771bbe4"
    end
  end

  def install
    bin.install "kb"
  end

  def caveats
    <<~EOS
      kb needs Chrome, Chromium, Edge or Brave, and a terminal with the kitty
      graphics protocol (Ghostty, kitty, WezTerm or Rex). Run `kb doctor` to check.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kb --version")
  end
end
