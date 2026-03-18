class Statusbar < Formula
  desc "Swift-native custom status bar for macOS"
  homepage "https://github.com/hytfjwr/StatusBar"
  url "https://github.com/hytfjwr/StatusBar/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER"
  license "MIT"

  depends_on macos: :tahoe
  depends_on xcode: ["26.0", :build]

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
    assert_predicate prefix/"StatusBar.app/Contents/Frameworks/libStatusBarKit.dylib", :exist?
  end
end
