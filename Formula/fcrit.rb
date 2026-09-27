class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "1.1.6"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v1.1.6/crit-darwin-arm64"
      sha256 "7f88903e5c5b7cd68e4f4aed4ec0542c42700e8dc4e1cc1a5864afa2ba283db2"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v1.1.6/crit-darwin-amd64"
      sha256 "0a1e95d0ea54b65a9b32bff77b0b500c2ae8d902f551bcef8e656c07a3167761"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v1.1.6/crit-linux-arm64"
      sha256 "d1b3fdefd62678ef4be27afc3fe3a84e43ea33b4196f4ad18cf05b78cb6e8b66"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v1.1.6/crit-linux-amd64"
      sha256 "61d009ea7cbbb112318cac93034fd0de2cf9d3573b90b4b9cf084900e3fd497c"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "1.1.6", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
