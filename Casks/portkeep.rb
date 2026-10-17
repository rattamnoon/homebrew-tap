cask "portkeep" do
  version "0.4.0"
  sha256 "8ce5fd7078e74b590f27c3e54476515dc0f41a47f6d6d20f7b0e00317432b6a1"

  url "https://github.com/rattamnoon/portkeep/releases/download/v#{version}/Portkeep-#{version}.dmg"
  name "Portkeep"
  desc "Menu bar app that keeps SSH, AWS SSM, kubectl and other port forwards up"
  homepage "https://portkeep.rattamnoon.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Portkeep.app"
  binary "#{appdir}/Portkeep.app/Contents/Resources/bin/portkeep"

  zap trash: [
    "~/Library/Application Support/Portkeep",
    "~/Library/Preferences/com.rattamnoon.portkeep.plist",
  ]

  caveats <<~EOS
    Portkeep #{version} is not notarized yet. If macOS says it can't check the app,
    open it once with right-click › Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/Portkeep.app"
  EOS
end
