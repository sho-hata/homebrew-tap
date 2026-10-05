class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "0.1.6"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.6/crit-darwin-arm64"
      sha256 "a7a5fad8e39c7b34c8eb433f566e297cce9c89938f930220332d2b7129220739"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.6/crit-darwin-amd64"
      sha256 "eaabbf0d1a522c8899a205e361a951647db478808b40c9e3505eb13f7b8bfeb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.6/crit-linux-arm64"
      sha256 "8fc272e510fc30c6f48d66a45a26fcaf081e2a302063197789aca22b5e348d54"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.6/crit-linux-amd64"
      sha256 "7c83c659ef025bd0291b4fef1de1f3bd1bb1bd9f3aab66c698433eda1a46c949"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "0.1.6", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
