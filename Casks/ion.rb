cask "ion" do
  version "0.1.52"
  sha256 "8e86f7077c49e538aaf98a48f2a6e8943ed82897288c2ceb9364e3a366e6c436"

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
