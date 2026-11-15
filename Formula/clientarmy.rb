class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.5.0"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.5.0/clientarmy_0.5.0_darwin_arm64.tar.gz"
    sha256 "966e4adb03a15f3c93ba359a9f26c70daef11f32b4b1df6b0379d3638d2aa481"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.5.0/clientarmy_0.5.0_darwin_amd64.tar.gz"
    sha256 "742f5ac3881bafd868fbe2789d1aa5b838c98ff6bc8006808a5d06d9569fe4b1"
  end

  depends_on macos: :ventura

  def install
    prefix.install "ClientArmy.app"
    bin.install_symlink prefix/"ClientArmy.app/Contents/MacOS/ClientArmy" => "clientarmy"
  end

  def caveats
    <<~EOS
      macOS permissions now belong to ClientArmy.app. Existing standalone CLI
      grants need a one-time approval for ClientArmy in System Settings.
      After confirming it works, remove obsolete clientarmy entries there.
    EOS
  end

  test do
    ENV["NO_COLOR"] = "1"
    assert_match "ClientArmy", shell_output("#{bin}/clientarmy --help 2>&1")
    assert_match "clientarmy permissions", shell_output("#{bin}/clientarmy permissions --help 2>&1")
  end
end
