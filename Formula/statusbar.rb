class Statusbar < Formula
  desc "Swift-native custom status bar for macOS"
  homepage "https://github.com/hytfjwr/StatusBar"
  url "https://github.com/hytfjwr/StatusBar/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "c892d4f9daee6426b3f1ffd7ee0eba620df7402c4ae542db93a32bf11c96404e"
  license "MIT"

  bottle do
    root_url "https://github.com/hytfjwr/homebrew-statusbar/releases/download/statusbar-0.4.0"
    sha256 arm64_tahoe: "4da35c73b89529897dc5276488a01e0a63b521987ec93b8a4519944c9087ea88"
  end

  depends_on xcode: ["26.0", :build]
  depends_on macos: :tahoe

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"

    # Create .app bundle
    app_bundle = buildpath/"StatusBar.app"
    (app_bundle/"Contents/MacOS").mkpath
    (app_bundle/"Contents/Frameworks").mkpath
    (app_bundle/"Contents/Resources").mkpath

    cp ".build/release/StatusBar", app_bundle/"Contents/MacOS/StatusBar"
    cp ".build/release/libStatusBarKit.dylib", app_bundle/"Contents/Frameworks/libStatusBarKit.dylib"
    cp "Resources/Info.plist", app_bundle/"Contents/Info.plist"

    if File.exist?("StatusBar.entitlements")
      system "codesign", "--force", "--deep",
             "--entitlements", "StatusBar.entitlements",
             "-s", "-", app_bundle.to_s
    end

    prefix.install app_bundle

    # Symlink to /Applications for easy access
    ln_sf prefix/"StatusBar.app", "/Applications/StatusBar.app"
  end

  def caveats
    <<~EOS
      StatusBar.app has been installed to:
        #{prefix}/StatusBar.app

      A symlink has been created at /Applications/StatusBar.app

      To start StatusBar, run:
        open /Applications/StatusBar.app
    EOS
  end

  test do
    assert_predicate prefix/"StatusBar.app/Contents/MacOS/StatusBar", :executable?
    assert_path_exists prefix/"StatusBar.app/Contents/Frameworks/libStatusBarKit.dylib"
  end
end
