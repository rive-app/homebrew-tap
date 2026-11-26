cask "ion" do
  version "0.1.45"
  sha256 "eb73874a03c8e5536e6177b607f42c089213cf1dfd9cd57e38f4d55ecd4a8b32"

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
