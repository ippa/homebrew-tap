class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.2.2"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.2.2/clientarmy_0.2.2_darwin_arm64.tar.gz"
    sha256 "9d629d7f1e5e0cda52116fd4cb1612da67f6c72c89f397e15e28828f37dc9fc9"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.2.2/clientarmy_0.2.2_darwin_amd64.tar.gz"
    sha256 "69968d87364b52f3fd4e42734e17f8015ee0464695521dfa5c2997882a52cf92"
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
