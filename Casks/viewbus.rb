cask "viewbus" do
  version "0.11.0"
  sha256 "1d9210aef1766d4cee114097dd30f9435b88f10b1f133f03f703e39c4e29867f"

  url "https://github.com/haakofli/viewbus-site/releases/download/v#{version}/ViewBus_#{version}_aarch64.dmg"
  name "ViewBus"
  desc "Azure Service Bus desktop manager with built-in MCP server"
  homepage "https://viewbus.app"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "ViewBus.app"

  # The DMG is Apple-unsigned (no Developer ID enrollment). Brew owns the
  # install location so it's appropriate to clear the quarantine bit here —
  # saves every brew user from running `xattr -cr` by hand.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ViewBus.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/viewbus",
    "~/Library/Preferences/com.viewbus.app.plist",
    "~/Library/WebKit/com.viewbus.app",
  ]
end
