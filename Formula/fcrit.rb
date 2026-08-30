class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "0.1.3"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.3/crit-darwin-arm64"
      sha256 "94222db92b925ddca4cb8d1a19b327dac81622c71879e667513df93925812908"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.3/crit-darwin-amd64"
      sha256 "f308c4652708bf1c7ded93d4a75fbf3ec92855be215332cb20d20bdac675d285"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.3/crit-linux-arm64"
      sha256 "3a75b25b13400e4b277f47727662e0109aaaf1198fb2c9fcb4a8498419c06bc4"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.3/crit-linux-amd64"
      sha256 "912b6e48fe41705d64813cc620c99e31019af2a0565fa88d089d85cc73aedac2"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "0.1.3", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
