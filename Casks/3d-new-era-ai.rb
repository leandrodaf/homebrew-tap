cask "3d-new-era-ai" do
  arch arm: "apple-silicon", intel: "intel"

  version "3.0.0"
  sha256 arm:   "6966f41b79c387edd42b0038695b53449f450d7ef4693d7ecce12ae2c014d2ef",
         intel: "deca6bd2f90d167c763d236299e1ffa1fec8fc868673ccb2a40578b56ffb419e"

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
