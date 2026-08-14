class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "0.1.0"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.0/crit-darwin-arm64"
      sha256 "120e2ecefc49f9b0a5a14894c73c42ac075e0514822f0686c0b11e5a845b386a"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.0/crit-darwin-amd64"
      sha256 "c6e83f65fde4b3cb5318818d7035ada0bcc2ed9bb2d509be1612b2ae569dbf4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.0/crit-linux-arm64"
      sha256 "97ec7378c18f0b999fcd16663fed1f864ec0cba8041dc16fcc7cb3600dbd76af"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.0/crit-linux-amd64"
      sha256 "a84d4d9a00b5a8de07e6a2522fec902094a69159ba08fa9e54532410ad048ce6"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "0.1.0", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
