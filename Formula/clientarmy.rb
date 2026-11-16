class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.6.0"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.6.0/clientarmy_0.6.0_darwin_arm64.tar.gz"
    sha256 "801cd9df92a74193bc2cde7fbe7e7ec7bf51bf47e59a6656b78b0c03d3826aa8"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.6.0/clientarmy_0.6.0_darwin_amd64.tar.gz"
    sha256 "6a977c1edab0a2277bb973c999c3fa224a38080b5b54f7b8953d07b5240a46bd"
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
