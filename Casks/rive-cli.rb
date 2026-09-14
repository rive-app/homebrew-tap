cask "rive-cli" do
  version "1.0.3"
  sha256 arm:          "504f3ec8c51cc800c2197098702d2ee1f559322f59519855e84ea99a608483be",
         x86_64_linux: "76940f2250a0fefac643d788cb93060f55fc9eda625e76bfe62eac4e95c4f0b8"

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
