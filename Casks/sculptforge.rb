cask "sculptforge" do
  version "0.13.5"
  sha256 "84a812465c5d4e495b27348fcf4e6e3851c840919110f31957f31d1b5a14457f"

  url "https://github.com/islandmed/SculptForge/releases/download/v#{version}/SculptForge-#{version}-darwin-universal.dmg",
      verified: "github.com/islandmed/SculptForge/"
  name "SculptForge"
  desc "Free, open-source digital sculpting app"
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
