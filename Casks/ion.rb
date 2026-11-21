cask "ion" do
  version "0.1.24"
  sha256 "f52fd9750f0c62eedc3cb78729e96658c486a5233f5492247d78b47b249a41a2"

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
