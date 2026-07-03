class Dbtl < Formula
  desc "Terminal UI for exploring dbt model lineage as ASCII art"
  homepage "https://github.com/hytfjwr/dbtl"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hytfjwr/dbtl/releases/download/v0.4.0/dbtl-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d2a063100a07b90d7bef3a75373d91ee76d6e65a44ec6699d47ecf76a3087fa0"
    end
    on_intel do
      url "https://github.com/hytfjwr/dbtl/releases/download/v0.4.0/dbtl-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "f8fbc74cbe66a5a18af0927321901005625db57940a26989924001fe6d93124a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hytfjwr/dbtl/releases/download/v0.4.0/dbtl-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "870664a1b10e23cb87a7a7c9c91d62e8d938043a863ef164361342b5bce879fa"
    end
    on_intel do
      url "https://github.com/hytfjwr/dbtl/releases/download/v0.4.0/dbtl-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd00d462f00dd672fbecf5b2c4c01adf0ca8f0ef212dea93319b19453232ec67"
    end
  end

  def install
    bin.install "dbtl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbtl --version")
  end
end
