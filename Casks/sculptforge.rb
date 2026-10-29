cask "sculptforge" do
  version "0.9.2"
  sha256 "f65be06bbee711ad05173042940543f524e00157766aa2a443264d1541c4e364"

  url "https://github.com/islandmed/SculptForge/releases/download/v#{version}/SculptForge-#{version}-darwin-universal.dmg",
      verified: "github.com/islandmed/SculptForge/"
  name "SculptForge"
  desc "Free, open-source digital sculpting, an alternative to ZBrush"
  homepage "https://sculptforge.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "SculptForge.app"
  binary "#{appdir}/SculptForge.app/Contents/MacOS/sculptforge-cli"

  # The app is signed ad hoc, not notarized: without this macOS refuses to open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/SculptForge.app"]
  end

  zap trash: "~/Library/Application Support/SculptForge"
end
