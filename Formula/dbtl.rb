class Dbtl < Formula
  desc "Terminal UI for exploring dbt model lineage as ASCII art"
  homepage "https://github.com/hytfjwr/dbtl"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hytfjwr/dbtl/releases/download/v0.4.1/dbtl-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "ba49a359c9d9545b0003b4682dbac33fe8adc9e173fab5b857717da9bdf12edd"
    end
    on_intel do
      url "https://github.com/hytfjwr/dbtl/releases/download/v0.4.1/dbtl-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "574e2d0eac21e2e045f58529bd07ded3c6f1e3cb6125cd4ea8b4b644156b7b96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hytfjwr/dbtl/releases/download/v0.4.1/dbtl-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15f118cf19aea79241791348747e218861c1891b85e77660b4a037ebeeb50ce4"
    end
    on_intel do
      url "https://github.com/hytfjwr/dbtl/releases/download/v0.4.1/dbtl-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1c9d837389a56bf760907216ba62fc40274d6a73a5c3b4640f5a5463483574a"
    end
  end

  def install
    bin.install "dbtl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dbtl --version")
  end
end
