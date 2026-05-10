cask "motobuds" do
  version "1.1.0"
  sha256 "f26570aa0097a9ddf1359a7de77c7a4d56848052db9fbfc13795966a53171573"

  url "https://github.com/Juanipis/motobuds/releases/download/v#{version}/MotoBuds-#{version}.zip"
  name "MotoBuds"
  desc "Native macOS companion for Motorola Moto Buds (ANC, EQ, battery, gestures)"
  homepage "https://github.com/Juanipis/motobuds"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "MotoBuds.app"

  zap trash: [
    "~/Library/Application Support/MotoBuds",
    "~/Library/Caches/com.juanipis.MotoBuds",
    "~/Library/Logs/MotoBuds.log",
    "~/Library/Preferences/com.juanipis.MotoBuds.plist",
  ]
end
