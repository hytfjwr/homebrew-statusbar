cask "statusbar" do
  version "0.5.4"
  sha256 "ff052b50e7099eae3b51b7d8fa6790d1491b0f7109706cbd8c062f279898e8cc"

  url "https://github.com/hytfjwr/StatusBar/releases/download/v#{version}/StatusBar.zip"
  name "StatusBar"
  desc "Swift-native custom status bar for macOS"
  homepage "https://github.com/hytfjwr/StatusBar"

  depends_on macos: ">= :tahoe"

  app "StatusBar.app"

  zap trash: [
    "~/.config/statusbar",
  ]
end
