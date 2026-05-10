cask "motobuds" do
  version "1.3.0"
  sha256 "12cb01bc8f3f9179725a544c1fc829e3afe38e4bb54d0f529e3acc3a91f46336"

  url      "https://github.com/Juanipis/motobuds/releases/download/v#{version}/MotoBuds-#{version}.zip"
  name     "MotoBuds"
  desc     "Native macOS companion for Motorola Moto Buds (ANC, battery, gestures)"
  homepage "https://github.com/Juanipis/motobuds"

  livecheck do
    url      :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "MotoBuds.app"

  # The build is ad-hoc signed (no Developer ID notarization). Strip the
  # quarantine xattr so Gatekeeper doesn't show a "Apple no ha podido
  # verificar…" dialog the first time the user opens it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MotoBuds.app"],
                   sudo: false
  end

  uninstall quit: "com.juanipis.MotoBuds"

  zap trash: [
    "~/Library/Application Support/MotoBuds",
    "~/Library/Caches/com.juanipis.MotoBuds",
    "~/Library/Logs/MotoBuds.log",
    "~/Library/Preferences/com.juanipis.MotoBuds.plist",
    "~/Library/Saved Application State/com.juanipis.MotoBuds.savedState",
  ]

  caveats <<~EOS
    On first launch macOS will ask for Bluetooth permission. Accept and
    MotoBuds will pair with the buds you already have connected.

    The app lives in the menu bar. To always launch it at login open
    "MotoBuds" → tab "Acerca de" → toggle "Abrir al iniciar sesión".
  EOS
end
