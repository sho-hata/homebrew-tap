class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "0.1.2"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.2/crit-darwin-arm64"
      sha256 "654acd8459ede58a9b47adb58cca37b09c1dfd5bbe9d5dc5c8b6c9524f5b1059"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.2/crit-darwin-amd64"
      sha256 "248b060c5b960f2a0b23a52aebed2e399b9da6049470a856fd3d970978bd1c89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.2/crit-linux-arm64"
      sha256 "088e0b45c6019e4d6fbcb9d583532539eb141a1e67b14f777bd2c55b771e9643"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.2/crit-linux-amd64"
      sha256 "b8f0c06fee4e671630b1a580d541c333794b882a11022fcec2ce8fca08abe0ce"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "0.1.2", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
