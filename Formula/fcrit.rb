class Fcrit < Formula
  desc "Fork of crit with Go LSP code intelligence in diffs"
  homepage "https://github.com/sho-hata/crit"
  version "0.1.7"
  license "MIT"

  # Installs the same `crit` binary as homebrew-core's upstream formula.
  conflicts_with "crit", because: "both install a `crit` binary"

  on_macos do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.7/crit-darwin-arm64"
      sha256 "0cfc5ad07ab579ecf8c39f1b118f13e6983d734f9cc0a8bbe3f34592073186d9"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.7/crit-darwin-amd64"
      sha256 "28595f06297ee2503d611ba5f2b0eb682e80101f1e5c6e76af05760a22e1a255"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.7/crit-linux-arm64"
      sha256 "60e15d120d9db6190e61d49cecb06559c85913331757728b6d4dd14854a41634"
    end
    on_intel do
      url "https://github.com/sho-hata/crit/releases/download/v0.1.7/crit-linux-amd64"
      sha256 "db06f1723db83d8f30fc0a1becf73f43fc5af777d69b5c56f3eeb6107dda6096"
    end
  end

  def install
    binary = Dir["crit-*"].first || "crit"
    bin.install binary => "crit"
  end

  test do
    output = shell_output("#{bin}/crit --version").strip
    assert_match "0.1.7", output
    # Guards against the upstream homebrew-core binary being picked up.
    assert_match "sho-hata/crit", output
  end
end
