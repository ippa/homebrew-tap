class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.3.0"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.3.0/clientarmy_0.3.0_darwin_arm64.tar.gz"
    sha256 "41039d36bd089bfd43ca99ff1e38234dd44334cd1ea841aae669674c295a5690"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.3.0/clientarmy_0.3.0_darwin_amd64.tar.gz"
    sha256 "4826a4ca44ac6aec301008a1e25b6635ec224f294df41d26f230271a0af11beb"
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
