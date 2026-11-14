class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.4.0"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.4.0/clientarmy_0.4.0_darwin_arm64.tar.gz"
    sha256 "86cd768c601d86ba3350cf650307b15780144ac4214253ba97546d24ef56ed4e"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.4.0/clientarmy_0.4.0_darwin_amd64.tar.gz"
    sha256 "bb6cd4cbd5e57692166796fdd7f57ea5a1ed498830d8656ad6d70cbcf1a68d81"
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
