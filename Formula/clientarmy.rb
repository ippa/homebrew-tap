class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.7.0"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.7.0/clientarmy_0.7.0_darwin_arm64.tar.gz"
    sha256 "01492060ad3ccbd920cb1fa562c4c48f4d89153122331b226cf46d853017e16d"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.7.0/clientarmy_0.7.0_darwin_amd64.tar.gz"
    sha256 "06ba9cb4ca044fbccaa5f509be34b91ee358b8459b2c737165b78bb9a160425e"
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
