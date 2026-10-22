cask "kumquat" do
  version "1.0.0"
  sha256 "aaa7ddbb68d68008989045c7d49ababc51162a51cd26396736ae8934337d1e0e"

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
    Kumquat is not notarized yet. On first launch, right-click Kumquat in
    Applications and choose Open, then confirm.
  EOS
end
