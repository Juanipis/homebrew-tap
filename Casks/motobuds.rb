cask "motobuds" do
  version "1.2.0"
  sha256 "5e64ef25bfa3bb7c8840d2c336086a8606a50db3e8544f203b8bf8fc66eb18cc"

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
