cask "statusbar" do
  version "0.6.0"
  sha256 "3bab1faaed52e824f0a65be2e3e4cf201a88056d8b8617e09a1bb1bb5ee3338b"

  url "https://github.com/hytfjwr/StatusBar/releases/download/v#{version}/StatusBar.zip"
  name "StatusBar"
  desc "Swift-native custom status bar"
  homepage "https://github.com/hytfjwr/StatusBar"

  depends_on macos: ">= :tahoe"

  app "StatusBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/StatusBar.app"]
  end

  zap trash: "~/.config/statusbar"
end
