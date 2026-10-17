cask "portkeep" do
  version "0.3.0"
  sha256 "713f0d58856548fca15af24622897e7094b9651cce5091ad22d13aeddaa11da6"

  url "https://github.com/rattamnoon/portkeep/releases/download/v#{version}/Portkeep-#{version}.dmg"
  name "Portkeep"
  desc "Menu bar app that keeps SSH, AWS SSM, kubectl and other port forwards up"
  homepage "https://github.com/rattamnoon/portkeep"

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
