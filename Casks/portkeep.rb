cask "portkeep" do
  version "0.1.0"
  sha256 "9f0170906cb2741e57b2658356bf8a7e2d6debcbef229f9df98bd97b36433865"

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
