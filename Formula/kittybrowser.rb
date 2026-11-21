# Installs the prebuilt kb from a GitHub release of graiz/kittybrowser.
# update.sh fills in the version and checksums for each release.
class Kittybrowser < Formula
  desc "Fast web browser that runs in a terminal pane, drawn with kitty graphics"
  homepage "https://github.com/graiz/kittybrowser"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/graiz/kittybrowser/releases/download/v0.2.0/kb-aarch64-apple-darwin.tar.gz"
      sha256 "f8fccdaa94d6c9707269aa975df5c9a6c0797077100658cb074be4bde33c1601"
    end
    on_intel do
      url "https://github.com/graiz/kittybrowser/releases/download/v0.2.0/kb-x86_64-apple-darwin.tar.gz"
      sha256 "ef372328b8b80c0c9c2be47ef830f0108440fe10b4ef24cfc40bd5a4b60ca09f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graiz/kittybrowser/releases/download/v0.2.0/kb-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c1f03c19cfb8af6030f67ab18f0e1b13c8bc6b5f46333d8f00b336a64538f92"
    end
    on_intel do
      url "https://github.com/graiz/kittybrowser/releases/download/v0.2.0/kb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "549abf532595e8a96df4a19dc79603ce1a33f2d97646cf6793adf1ccf8c94aab"
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
