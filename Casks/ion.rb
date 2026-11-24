cask "ion" do
  version "0.1.37"
  sha256 "0dd9ee36478221a9845b67ae3f0fc6e0f47abced73f86d8147d79e87ae339afa"

  url "https://releases.rive.app/ion/v#{version}/Ion-macos-arm64.zip"
  name "Ion"
  desc "Code editor drawn with the Rive renderer"
  homepage "https://rive.app/"

  livecheck do
    url "https://releases.rive.app/ion/latest/manifest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Ion.app"
  binary "#{appdir}/Ion.app/Contents/MacOS/ion"

  zap trash: [
    "~/.config/ion",
    "~/Library/Caches/Ion",
  ]
end
