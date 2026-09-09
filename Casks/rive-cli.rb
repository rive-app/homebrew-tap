cask "rive-cli" do
  version "0.1.18"
  sha256 arm:          "b198c39342c7226ae4b7415a4c770b012bf8436579fde9c96fea95166127b2c4",
         x86_64_linux: "40c3bd8bba175c5f8c9ab4af6d9b85d837b0c70f052cdf6df9ea4354c3ec1946"

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
