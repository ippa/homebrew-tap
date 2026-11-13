class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.2.3"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.2.3/clientarmy_0.2.3_darwin_arm64.tar.gz"
    sha256 "46a9341bb97f2c3a40746e3f4bcdafd42d925432029ee4c59a82886b846d9865"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.2.3/clientarmy_0.2.3_darwin_amd64.tar.gz"
    sha256 "a86778114840a160d7b0a680fa04a5bbca1777d525929eed5372f1ba8a736cfe"
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
