cask "leve" do
  version "0.6.1"

  on_arm do
    sha256 "a1c4cedf1c873812fc468b84d670abc817b37732ae717c84c76263f12156fc53"

    url "https://github.com/moraliasp/leve/releases/download/v#{version}/Leve_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "08fba430626b83935190fe43d3ced0b16f30ca05557d6cf316d57f9bcbf1b21e"

    url "https://github.com/moraliasp/leve/releases/download/v#{version}/Leve_#{version}_x64.dmg"
  end

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

  preflight_steps do
    if_path_exists "Leve.app/Contents/Info.plist", base: :appdir do
      run "/bin/echo", args: ["Leve is already installed. Keeping it; it updates itself."], print_stdout: true
      remove "Leve.app", recursive: true
      move "Leve.app", "Leve.app", source_base: :appdir
    end
  end

  zap trash: [
    "~/Library/Application Support/br.com.moralia.leve",
    "~/Library/Caches/br.com.moralia.leve",
    "~/Library/HTTPStorages/br.com.moralia.leve",
    "~/Library/Preferences/br.com.moralia.leve.plist",
    "~/Library/Saved Application State/br.com.moralia.leve.savedState",
    "~/Library/WebKit/br.com.moralia.leve",
  ]
end
