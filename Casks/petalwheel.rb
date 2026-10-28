cask "petalwheel" do
  version "1.2.0"
  sha256 "e43ce6386cf2e6951dd16a324f97f45ebddbaa456f71c5c211c7dc0ee5a3e271"

  url "https://github.com/TheAlexRay/petalwheel/releases/download/v#{version}/Petalwheel-#{version}.dmg"
  name "Petalwheel"
  desc "Menu-bar file converter: drag files, tap Shift, drop on a petal"
  homepage "https://github.com/TheAlexRay/petalwheel"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Petalwheel.app"

  zap trash: [
    "~/Library/Application Support/Petalwheel",
    "~/Library/Preferences/studio.kipper.Petalwheel.plist",
  ]

  caveats <<~EOS
    Petalwheel is not notarized yet, so macOS blocks the first launch.
    macOS 15 and later: open Petalwheel once, then go to
      System Settings > Privacy & Security and click "Open Anyway".
    macOS 14: right-click Petalwheel in Applications and choose Open.
  EOS
end
