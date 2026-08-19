class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "0.1.1"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.1/crit-darwin-arm64"
      sha256 "cfa8007b48c7a02d8606b28ae7c940573be9c8879d19d4167cdebccfbfe100ef"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.1/crit-darwin-amd64"
      sha256 "6ccb28fc4b3c54e85635fabf9251272192389c3917b0a57dba05fdedb09c1acd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.1/crit-linux-arm64"
      sha256 "0405dfb10404ab9bf7a6c9a0a7c5667cda5867f7c18b5bfdf0c8cad417494f0f"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.1/crit-linux-amd64"
      sha256 "bfe855a561efef2e85e55977a6294b233aefe96a71e2a3b8d4d9a7804595f274"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "0.1.1", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
