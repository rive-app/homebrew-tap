cask "ion" do
  version "0.1.54"
  sha256 "5ba084103cfd4087fa456435c60697b14c5e102f6c1eb6c516eb23d08091d1c1"

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
