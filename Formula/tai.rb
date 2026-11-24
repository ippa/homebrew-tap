class Tai < Formula
  desc "Cross-platform terminal AI assistant with guarded command execution"
  homepage "https://tai.ippa.se"
  version "2.2.0"

  on_macos do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.0/tai_2.2.0_darwin_arm64.tar.gz"
      sha256 "30126aa05a74cd229a911e0af274527839ff6b03c313bc5c049ffb90893b6a51"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.0/tai_2.2.0_darwin_x64.tar.gz"
      sha256 "7e714655536352d1b95fe16da956a6c19f42a36d992fe2bde2bafe2ce622c654"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.0/tai_2.2.0_linux_arm64.tar.gz"
      sha256 "14b28e56074a797acd13422549df5d7b7d3cbbcfb45edeb8ec129e7ca8e6a02f"
    end
    on_intel do
      url "https://github.com/ippa/homebrew-tap/releases/download/tai-v2.2.0/tai_2.2.0_linux_x64.tar.gz"
      sha256 "9f485405f9e97bf737f9e302f0ddfe65ef05215519a22b7fb4f2708ecc60e1ca"
    end
  end

  def install
    bin.install "tai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tai --version")
  end
end
