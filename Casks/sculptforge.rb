cask "sculptforge" do
  version "0.10.4"
  sha256 "1efb1476c53aa831585f4a6c66011be6bbc454215461864a97e888b915df27ce"

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
