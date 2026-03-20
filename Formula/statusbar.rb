class Statusbar < Formula
  desc "Swift-native custom status bar for macOS"
  homepage "https://github.com/hytfjwr/StatusBar"
  url "https://github.com/hytfjwr/StatusBar/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "dae4b506b7cd7635071b482813e1f756a7cfafd754fd189cacc18bc1e23cee27"
  license "MIT"

  bottle do
    root_url "https://github.com/hytfjwr/homebrew-statusbar/releases/download/statusbar-0.5.0"
    sha256 arm64_tahoe: "47b328a80007bae6b74e40809b44d35151774ab44331be6b18fa811572be1fce"
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
  end

  def caveats
    <<~EOS
      StatusBar.app has been installed to:
        #{prefix}/StatusBar.app

      To start StatusBar, run:
        open #{prefix}/StatusBar.app

      To link it to your Applications folder:
        ln -sf #{prefix}/StatusBar.app /Applications/StatusBar.app
    EOS
  end

  test do
    assert_predicate prefix/"StatusBar.app/Contents/MacOS/StatusBar", :executable?
    assert_path_exists prefix/"StatusBar.app/Contents/Frameworks/libStatusBarKit.dylib"
  end
end
