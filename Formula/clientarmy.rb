class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.1.0"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.1.0/clientarmy_0.1.0_darwin_arm64.tar.gz"
    sha256 "94a36aae5e96219ddc37a1d9d96554e4f0cf07a61a461e4f6bff6d3f62bd18d1"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.1.0/clientarmy_0.1.0_darwin_amd64.tar.gz"
    sha256 "3742e965ca0d4d438c128291c0f90c83b93b5cb3104912f9629e7e9ee0ae9246"
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
