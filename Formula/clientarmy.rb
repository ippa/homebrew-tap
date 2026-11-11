class Clientarmy < Formula
  desc "Manage Android emulators, iOS simulators, and browser windows"
  homepage "https://github.com/ippa/homebrew-tap"
  version "0.1.1"

  on_arm do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.1.1/clientarmy_0.1.1_darwin_arm64.tar.gz"
    sha256 "628bdb51bee7c2dae278f345e144442cae94854a22501f18130e505f5030237b"
  end

  on_intel do
    url "https://github.com/ippa/homebrew-tap/releases/download/clientarmy-v0.1.1/clientarmy_0.1.1_darwin_amd64.tar.gz"
    sha256 "f93be76c3d8f456b94ce9231cf700666b7c311888384da15c0c5fdc33a83705c"
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
