cask "leve" do
  version "0.3.0"
  sha256 "b379f42d13fccc85af28cf401c9c406e650b2e85b31029a307b99603ae6a7b9b"

  url "https://github.com/moraliasp/leve/releases/download/v#{version}/Leve_#{version}_universal.dmg"
  name "Leve"
  desc "Small, fast, private Markdown viewer"
  homepage "https://github.com/moraliasp/leve"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Leve.app"

  zap trash: [
    "~/Library/Application Support/br.com.moralia.leve",
    "~/Library/Caches/br.com.moralia.leve",
    "~/Library/HTTPStorages/br.com.moralia.leve",
    "~/Library/Preferences/br.com.moralia.leve.plist",
    "~/Library/Saved Application State/br.com.moralia.leve.savedState",
    "~/Library/WebKit/br.com.moralia.leve",
  ]

  caveats <<~EOS
    Leve is not signed or notarized by Apple yet, so macOS blocks the first launch.
    Open Leve once, click Done, then go to System Settings > Privacy & Security
    and click Open Anyway. macOS may ask again after brew upgrade.
    Or remove the quarantine flag yourself, if you trust this download:
      xattr -dr com.apple.quarantine "#{appdir}/Leve.app"
    Checksums and build provenance: https://github.com/moraliasp/leve/releases
  EOS
end
