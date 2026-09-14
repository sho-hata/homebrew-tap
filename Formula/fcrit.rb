class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "0.1.5"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.5/crit-darwin-arm64"
      sha256 "b7484f17b7b4fd662932497e30ee7a940f6096b5ff73b96f7e1949ae105b6ed8"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.5/crit-darwin-amd64"
      sha256 "063988e3c62a2c86cdb74ca77e08b3e737431231858d283c90bbb2a271e54996"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.5/crit-linux-arm64"
      sha256 "f3fd5cbff3e2ebe10e8fc44e52bb928ba50f51647b000b7093df3a9afa7f31b0"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.5/crit-linux-amd64"
      sha256 "9f1d3c463cf8d3a56ee7bc7d6e8bfba84073718762b27cde222527fceeb80a4f"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "0.1.5", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
