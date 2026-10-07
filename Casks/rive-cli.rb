cask "rive-cli" do
  version "1.5.0"
  sha256 arm:          "1454eb94c5f6eda67d460d9d1bd356802bf7f84d722d41f80d64fd27e56a33de",
         x86_64_linux: "be18f3719e3724a3b7c5754e6a2d8c616488aeed5f82982ef434ce54f644683a"

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
