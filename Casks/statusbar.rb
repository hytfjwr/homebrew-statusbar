cask "statusbar" do
  version "0.11.0"
  sha256 "60a22b1823c378a76019c206d2df67392ea392c946e92afe63e0a1574a59abbd"

  url "https://github.com/hytfjwr/StatusBar/releases/download/v#{version}/StatusBar.zip"
  name "StatusBar"
  desc "Swift-native custom status bar"
  homepage "https://github.com/hytfjwr/StatusBar"

  depends_on macos: ">= :tahoe"

  app "StatusBar.app"
  binary "#{appdir}/StatusBar.app/Contents/MacOS/sbar"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/StatusBar.app"]
  end

  zap trash: "~/.config/statusbar"
end
