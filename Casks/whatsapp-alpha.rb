cask "whatsapp-alpha" do
  version "2.23.9.78"
  sha256 "b7b2be6289a26c5f38ce74ffaf7174a35284cb07aa3f4efad7febbd4f62a1364"

  url "https://web.whatsapp.com/desktop/mac_native/release/?version=#{version}&extension=zip&configuration=Beta&branch=relbranch"
  name "WhatsApp Alpha"
  desc "Native desktop client for WhatsApp"
  homepage "https://faq.whatsapp.com/451924530376167/?cms_platform=web"

  livecheck do
    url "https://web.whatsapp.com/desktop/mac_native/updates/?branch=relbranch&configuration=Beta"
    strategy :sparkle do |item|
      item["url"][/\?version=v?(\d+(?:\.\d+)+)[ "&]/i, 1]
    end
  end

  auto_updates true
  conflicts_with cask: [
    "whatsapp",
    "whatsapp-beta",
  ]
  depends_on macos: ">= :big_sur"

  app "WhatsApp.app"

  zap trash: [
    "~/Library/Application Support/WhatsApp",
    "~/Library/Application Support/WhatsApp.ShipIt",
    "~/Library/Caches/WhatsApp",
    "~/Library/Caches/WhatsApp.ShipIt",
    "~/Library/Preferences/ByHost/WhatsApp.ShipIt.*.plist",
    "~/Library/Preferences/WhatsApp.plist",
    "~/Library/Preferences/WhatsApp-Helper.plist",
    "~/Library/Saved Application State/WhatsApp.savedState",
  ]
end
