cask "sculptforge" do
  version "0.11.3"
  sha256 "1bc14479715c4a29bd8b6217042aaf93311319e53091c686edb8503e1c2b18db"

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
