class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.2.1"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.2.1/clientarmy_0.2.1_darwin_arm64.tar.gz"
    sha256 "b0ac200c6ca32da38cbe3f1f5851f9618b16c890eccb6ced1cc59d526584cb09"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.2.1/clientarmy_0.2.1_darwin_amd64.tar.gz"
    sha256 "6dbde51ac2f6174fbef8bcdd348fbecf4b0c56df99df5a3634521c175afa0c63"
  end

  depends_on macos: :ventura

  def install
    bin.install "clientarmy"
  end

  test do
    ENV["NO_COLOR"] = "1"
    assert_match "ClientArmy", shell_output("#{bin}/clientarmy --help 2>&1")
    assert_match "clientarmy permissions", shell_output("#{bin}/clientarmy permissions --help 2>&1")
  end
end
