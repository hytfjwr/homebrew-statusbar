cask "statusbar" do
  version "0.7.2"
  sha256 "f18438b1bf6aff195b2379310124907b2ef66b9d710ab16b5b93f8a7cbb64567"

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
