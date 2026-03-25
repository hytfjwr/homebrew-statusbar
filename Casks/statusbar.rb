cask "statusbar" do
  version "0.9.0"
  sha256 "41401730c69b16e8607cd191fb2461ed867de8070eabccd5727c5fe4ceade6a4"

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
