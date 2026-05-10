cask "fanctl" do
  version "1.2.0"
  sha256 "55fd3a9ad1c23e250e422bb408c965a3379893425b598012322265e663800077"

  url      "https://github.com/Juanipis/fanctl/releases/download/v#{version}/FanCtl-#{version}.zip"
  name     "FanCtl"
  desc     "Native macOS fan controller for Apple Silicon"
  homepage "https://github.com/Juanipis/fanctl"

  livecheck do
    url     :url
    strategy :github_latest
  end

  # Apple Silicon only — the SMC backend ships zero Intel code paths.
  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "FanCtl.app"

  # The build is ad-hoc signed (no Developer ID notarization). Strip the
  # quarantine xattr so Gatekeeper doesn't shame the user with a "downloaded
  # from the internet" dialog the first time they open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FanCtl.app"],
                   sudo: false
  end

  uninstall quit:      "com.jpdiaz.FanCtl",
            launchctl: "com.jpdiaz.FanCtl.Helper"

  zap trash: [
    "~/Library/Caches/com.jpdiaz.FanCtl",
    "~/Library/Preferences/com.jpdiaz.FanCtl.plist",
    "~/Library/Saved Application State/com.jpdiaz.FanCtl.savedState",
  ]

  caveats <<~EOS
    FanCtl needs a privileged background helper to talk to the SMC. Open the
    app from your menu bar and click "Install Helper" — macOS will redirect
    you to System Settings → General → Login Items & Extensions → Background.
    Toggle FanCtl ON, then click "Retry" in the popover.

    The helper persists across reboots and keeps the selected mode running
    even when the app is closed.
  EOS
end
