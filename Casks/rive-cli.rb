cask "rive-cli" do
  version "0.1.21"
  sha256 arm:          "3d34f81e938e376833d714f17cca1aa9399e943d7cd02e29505b417b218f6884",
         x86_64_linux: "9e7ceba1054e6265dec84e4c9f79f707a2204c5a6024e5f73a7a6831cafc674f"

  on_macos do
    url "https://releases.rive.app/cli/v#{version}/rive-macos-arm64.tar.gz"

    depends_on macos: :ventura
    depends_on arch: :arm64
  end
  on_linux do
    url "https://releases.rive.app/cli/v#{version}/rive-linux-x64.tar.gz"

    depends_on arch: :x86_64
  end

  name "Rive CLI"
  desc "Command-line tools for Rive"
  homepage "https://rive.app/"

  livecheck do
    url "https://releases.rive.app/cli/latest/manifest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  binary "rive"

  zap trash: "~/.rive"

  caveats <<~EOS
    This Homebrew install is a pinned CLI binary. `rive update` and
    `rive switch` are only supported for the curl installer (~/.rive/bin).
  EOS
end
