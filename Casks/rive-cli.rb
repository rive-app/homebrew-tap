cask "rive-cli" do
  version "0.1.22"
  sha256 arm:          "f5b0d6c1e3b4098b0b051e3aeb9ff2bea9ac57d4b8bceeaa9677ca8c650eb77f",
         x86_64_linux: "ab2adc475544c4d65812ddc176e2d874e2ca221f6d1e61d57fb6d7ae6f19e3d4"

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
