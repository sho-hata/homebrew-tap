class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "0.1.4"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.4/crit-darwin-arm64"
      sha256 "ed8733877246dbc549d53bf48108a7573fc4d43f90761ea96343f69bca9d1787"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.4/crit-darwin-amd64"
      sha256 "d5a77cc43406404d9483b17b0abf939fe428bcb004cf96534ad2bc110f275403"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.4/crit-linux-arm64"
      sha256 "83fea0e5b4686fe00d3e1781eeed46723e81d91390e50c39b2ef1296adfe1094"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.4/crit-linux-amd64"
      sha256 "df2722d5429d66dae324963403701375401e5fda349672e72f06fee81c2c864c"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "0.1.4", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
