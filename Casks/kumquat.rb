cask "kumquat" do
  version "1.0.1"
  sha256 "f710d0e27358884e45db99822ff98e4a272680fe12311474818c38c202e70af3"

  url "https://github.com/TheAlexRay/kumquat/releases/download/v#{version}/Kumquat-#{version}.dmg"
  name "Kumquat"
  desc "Menu-bar file converter: drag files, tap Shift, drop on a petal"
  homepage "https://github.com/TheAlexRay/kumquat"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Kumquat.app"

  zap trash: [
    "~/Library/Application Support/Kumquat",
    "~/Library/Preferences/studio.kipper.Kumquat.plist",
  ]

  caveats <<~EOS
    Kumquat is not notarized yet, so macOS blocks the first launch.
    macOS 15 and later: open Kumquat once, then go to
      System Settings > Privacy & Security and click "Open Anyway".
    macOS 14: right-click Kumquat in Applications and choose Open.
  EOS
end
