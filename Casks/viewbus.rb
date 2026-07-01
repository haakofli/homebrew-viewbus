cask "viewbus" do
  version "0.8.2"
  sha256 "db1edcb6151ea2f191d8785d2b3f773cdd2f93a8fd24accd8034b7b65e3321fc"

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
