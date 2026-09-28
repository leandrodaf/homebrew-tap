cask "3d-new-era-ai" do
  arch arm: "apple-silicon", intel: "intel"

  version "2.0.0"
  sha256 arm:   "72310a3b773466b4bbcbc25cf26bdb084bf7ffaadb3ec6baacb6ce538d595d9c",
         intel: "94cee25b0dded650eb7c4a53225d98983b5acfcfe576f716627cfd4a083fc8d9"

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
