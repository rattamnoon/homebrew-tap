cask "portkeep" do
  version "0.2.0"
  sha256 "343a9ebf3a4322f58b0b7c34233ef7c783295796576fb28f590cf4f7dae792b3"

  url "https://github.com/rattamnoon/portkeep/releases/download/v#{version}/Portkeep-#{version}.dmg"
  name "Portkeep"
  desc "Menu bar app that keeps SSH, AWS SSM, kubectl and other port forwards up"
  homepage "https://github.com/rattamnoon/portkeep"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Portkeep.app"

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
