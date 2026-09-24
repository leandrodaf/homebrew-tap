cask "3d-new-era-ai" do
  arch arm: "apple-silicon", intel: "intel"

  version "1.8.0"
  sha256 arm:   "0928eb8994cdfab2cc8521cab5bdd6b6b43e41766e7d18486e8eab8c6f1c2d4f",
         intel: "8a08aadd3320b1a6e5b87b1e09c6d96100e3a5ccff9dd07c62966776cddbd9f7"

  url "https://github.com/leandrodaf/3d-new-era-ai/releases/download/v#{version}/newera-macos-#{arch}.zip"
  name "3D New Era AI"
  desc "Open-source home design editor with a built-in MCP server for AI agents"
  homepage "https://3dneweraai.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "3D New Era AI.app"
  binary "#{appdir}/3D New Era AI.app/Contents/MacOS/newera"

  zap trash: [
    "~/.cache/3d-new-era-ai",
    "~/Library/Application Support/3d-new-era-ai",
  ]

  caveats <<~EOS
    The app is not notarized by Apple. If macOS refuses to open it the first time:
      xattr -dr com.apple.quarantine "#{appdir}/3D New Era AI.app"

    Connect your AI: https://github.com/leandrodaf/3d-new-era-ai#connect-your-ai
  EOS
end
