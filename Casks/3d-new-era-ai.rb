cask "3d-new-era-ai" do
  arch arm: "apple-silicon", intel: "intel"

  version "1.10.0"
  sha256 arm:   "82efdc56264fb95f89c0323656f3a28a7e44b9f1fb682fd57087a23bcdacd6bb",
         intel: "36bfceb1f86ea3d13aa2ee1ea9a90d885d7f3121bd2ffa7e8fbaaadb4cc986fc"

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
