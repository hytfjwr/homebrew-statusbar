class Statusbarkit < Formula
  desc "Plugin development SDK for StatusBar"
  homepage "https://github.com/hytfjwr/StatusBarKit"
  url "https://github.com/hytfjwr/StatusBarKit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"

  depends_on macos: :tahoe
  depends_on xcode: ["26.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"

    lib.install ".build/release/libStatusBarKit.dylib"

    # Install Swift module interfaces for plugin compilation
    module_dir = lib/"swift/statusbarkit"
    module_dir.mkpath

    modules_path = ".build/release/Modules"
    if File.directory?(modules_path)
      Dir.glob("#{modules_path}/StatusBarKit.*").each do |f|
        cp f, module_dir/File.basename(f)
      end
    end
  end

  def caveats
    <<~EOS
      StatusBarKit has been installed for plugin development.

      Dynamic library: #{lib}/libStatusBarKit.dylib
      Swift modules:   #{lib}/swift/statusbarkit/

      For SPM-based plugin development, you can also depend on StatusBarKit
      directly via its Git URL:
        .package(url: "https://github.com/hytfjwr/StatusBarKit", from: "#{version}")
    EOS
  end

  test do
    assert_predicate lib/"libStatusBarKit.dylib", :exist?
  end
end
