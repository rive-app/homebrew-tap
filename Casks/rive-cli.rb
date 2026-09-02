cask "rive-cli" do
  version "0.1.12"
  sha256 "98fc1dc583a4becb64f1272a9777bcc95a56af50e04f8d5b03ef975722cef0db"

  url "https://releases.rive.app/cli/v#{version}/rive-macos-arm64.tar.gz"
  name "Rive CLI"
  desc "Command-line tools for Rive"
  homepage "https://rive.app/"

  livecheck do
    url "https://releases.rive.app/cli/latest/manifest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "rive"

  # Leaves ~/.rive (version cache, current/default) on uninstall.
  zap trash: "~/.rive"

  caveats <<~EOS
    This Homebrew install is a pinned CLI binary. `rive update` and
    `rive switch` are only supported for the curl installer (~/.rive/bin).
  EOS
end
