cask "statusbar" do
  version "0.5.5"
  sha256 "2acfaca467732ed7cac8b2452fb715ffeee7b80e4355e3f50e14feb621ef1914"

  url "https://github.com/hytfjwr/StatusBar/releases/download/v#{version}/StatusBar.zip"
  name "StatusBar"
  desc "Swift-native custom status bar"
  homepage "https://github.com/hytfjwr/StatusBar"

  depends_on macos: ">= :tahoe"

  app "StatusBar.app"

  zap trash: "~/.config/statusbar"
end
